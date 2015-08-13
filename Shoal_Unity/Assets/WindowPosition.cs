///SOURCE: http://forum.unity3d.com/threads/window-manipulation-in-unity.84252/
//Thanks Tautvydas Zilys on the Unity Forum for his transparent window material
//edited by @ragekit


//WARNING : Only work on windows, probably >XP

using UnityEngine;
using System.Collections;
using System.Runtime.InteropServices;
using System;




public class WindowPosition : MonoBehaviour
{
    [StructLayout(LayoutKind.Sequential)]
    public struct RECT
    {
        public int X;
        public int Y;
        public int Width;
        public int Height;
    }
    private struct MARGINS
    {
        public int cxLeftWidth;
        public int cxRightWidth;
        public int cyTopHeight;
        public int cyBottomHeight;
    }
    public enum LWA
    {
        ColorKey = 0x1,
        Alpha = 0x2
    }
    public enum GWL
    {
        ExStyle = -20
    }


    [DllImport("user32.dll")]
    static extern bool SetWindowPos(IntPtr hWnd, int hWndInsertAfter, int X, int Y, int cx, int cy, uint uFlags);
    [DllImport("user32.dll")]
    static extern bool GetWindowRect(IntPtr hWnd, ref RECT Rect);
    [DllImport("user32.dll")]
    static extern IntPtr GetForegroundWindow();
    [DllImport("user32.dll")]
    static extern IntPtr SetWindowLong(IntPtr hwnd, int _nIndex, long dwNewLong);
    [DllImport("user32.dll")]
    static extern bool MoveWindow(IntPtr hWnd, int X, int Y, int nWidth, int nHeight, bool bRepaint);
    [DllImport("Dwmapi.dll")]
    private static extern uint DwmExtendFrameIntoClientArea(IntPtr hWnd, ref MARGINS margins);
    [DllImport("user32.dll")]
    public static extern bool SetLayeredWindowAttributes(IntPtr hWnd, int crKey, byte alpha, LWA dwFlags);
    [DllImport("user32.dll", EntryPoint = "GetWindowLong")]
    public static extern int GetWindowLong(IntPtr hWnd, int nIndex);
    //	HWND WINAPI GetForegroundWindow(void);

    public bool AlwaysOnForeground;
    public bool NoBorder;
    public bool changeStartPosition;
    public Vector2 StartPosition;

    public bool changeStartSize;
    public Vector2 StartSize;

    //WARNING : your window won't be able to receive ANY click event
    public bool ClickThrought;

    public bool SetWindowTransparent;

#if UNITY_STANDALONE_WIN && !UNITY_EDITOR

    //prevent user moving window
    const uint SWP_NOMOVE = 0x2;
    //dont change windows size
    const uint SWP_NOSIZE = 1;
    //dont change zorder
    const uint SWP_NOZORDER = 0X4;
    //show window
    const uint SWP_SHOWWINDOW = 0x0040;
    //hide windows
    const uint SWP_HIDEWINDOW = 0x0080;

    //stick window on top
    const int HWND_TOPMOST = -1;

    const int GWL_STYLE = -16;
    const int GWL_EXSTYLE = -20;
    const uint WS_POPUP = 0x80000000;
    const uint WS_VISIBLE = 0x10000000;
    const int WS_EX_LAYERED = 0x80000;

    const int WS_EX_TRANSPARENT = 0x20;

    void Start()
    {
      if(AlwaysOnForeground) WindowForeground();
      if(changeStartSize)
      {
        SetWindowSize((int)StartSize.x,(int)StartSize.y);
      }
      if(changeStartPosition)
      {
        SetWindowPosition((int)StartPosition.x,(int)StartPosition.y);
      }
      if(NoBorder) WindowNoBorder();

      if(SetWindowTransparent)
      {
        SetTransparent();
      }

      if(ClickThrought)
      {
        SetClickThrought();
      }
    }

    public bool SetWindowPosition(int x, int y)
    {
      if(x>=0 && y>=0)
      {
        IntPtr wPtr= GetForegroundWindow();
        RECT rect = new RECT();
        GetWindowRect(GetForegroundWindow(),ref rect);
        return MoveWindow(wPtr, x, y, rect.Width, rect.Height, true);
      }
      return false;
    }

    public bool SetWindowSize(int x, int y)
    {
      if(x>=0 && y>=0)
      {
        IntPtr wPtr= GetForegroundWindow();
        RECT rect = new RECT();
        GetWindowRect(GetForegroundWindow(),ref rect);
        return MoveWindow(wPtr, rect.X, rect.Y, x,y, true);
      }
      return false;
    }

    public bool WindowForeground()
    {
      RECT rect = new RECT();
      GetWindowRect(GetForegroundWindow(),ref rect);
      return SetWindowPos(GetForegroundWindow(), HWND_TOPMOST, rect.X, rect.Y, 0, 0, SWP_NOSIZE | SWP_SHOWWINDOW);
    }

    public bool WindowNoBorder(){
      SetWindowLong(GetForegroundWindow (), GWL_STYLE, WS_POPUP | WS_VISIBLE);

      return true;
    }

    public void SetTransparent()
    {
      var margins = new MARGINS() { cxLeftWidth = -1 };
      var hwnd = GetForegroundWindow();
      DwmExtendFrameIntoClientArea(hwnd, ref margins);

    }

    public void SetClickThrought(){
      var hwnd = GetForegroundWindow();
      int w =GetWindowLong(hwnd,GWL_EXSTYLE);
      SetWindowLong(hwnd, GWL_EXSTYLE, w | WS_EX_LAYERED | WS_EX_TRANSPARENT);
      SetLayeredWindowAttributes(hwnd, 0, 255, LWA.Alpha);
    }

#endif
}
