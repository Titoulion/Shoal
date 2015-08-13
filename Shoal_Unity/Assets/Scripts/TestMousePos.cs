using UnityEngine;
using System;
using System.Collections;
using System.Runtime.InteropServices;

public class TestMousePos : MonoBehaviour {

	[StructLayout( LayoutKind.Sequential )]
	public struct POINT
	{
		public int X;
		public int Y;
		public static implicit operator Vector2( POINT p )
		{
			return new Vector2( p.X, p.Y );
		}
	}
	[DllImport( "user32.dll" )][return: MarshalAs( UnmanagedType.Bool )]
	static extern bool GetCursorPos( out POINT lpPoint );
	
	/*public static void Init( PanoramaMaster master )
	{
		Vector2 inputCursor = Input.mousePosition;
		// flip input Cursor y (as the Reference "0" is the last scanline)
		inputCursor.y = Screen.height - 1 - inputCursor.y;
		POINT p;
		GetCursorPos( out p );
		renderRegionOffset = p - inputCursor;
		renderRegionScale = new Vector2( (float) master.width / Screen.width, (float) master.height / Screen.height );
		Debug.Log( "Scale:  " + renderRegionScale + "\nOffset: " + renderRegionOffset + "\n" );
	}*/
	Vector2 windowsMousePos;
	POINT myPoint = new POINT();
	
	
	// Use this for initialization
	void Start () 
	{
	
	}
	
	// Update is called once per frame
	void Update () 
	{
		GetCursorPos(out myPoint);
		windowsMousePos = new Vector2(myPoint.X,myPoint.Y);

		float distanceStuff = Vector2.Distance (windowsMousePos,new Vector2(100f,100f));
		float valueOpacity = 1f;

		if(distanceStuff>400f)
		{
			valueOpacity = 1f;
		}
		else if(distanceStuff>300f)
		{
			valueOpacity = Map (distanceStuff,400f,300f,1f,0.2f);
		}
		else
		{
			valueOpacity = 0.2f;
		}



			Shader.SetGlobalFloat("_GlobalOpacity",valueOpacity);
		
	}

	void OnGUI()
	{
		//GUI.Label(new Rect(0f,0f,100f,140f),windowsMousePos.x+"    "+windowsMousePos.y);

	}

	public float Map(float val, float fromMin, float fromMax, float toMin, float toMax) {
		return ((val - fromMin) / (fromMax - fromMin)) * (toMax - toMin) + toMin;
	}
}
