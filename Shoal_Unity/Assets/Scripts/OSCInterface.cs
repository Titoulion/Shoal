using System;
using System.Collections.Generic;
using System.Net;
using UnityEngine;

using UnityOSC;

public class OSCInterface : MonoBehaviour
{
    public string ServerName = "MAX-in";
    public int serverIP = 12000;

    private OSCServer server;
	MainScript main;


    private void Awake()
    {
        OSCHandler.Instance.CreateServer(ServerName, serverIP);
		main = MainScript.Instance;
        var pd = OSCHandler.Instance.Servers[ServerName];
        server = pd.server;
        Debug.Log("OSC: "+server);
               
    }
	
    private void OnEnable()
    {
        server.PacketReceivedEvent += OnPacketReceivedEvent;
    }

    private void OnDisable()
    {
        server.PacketReceivedEvent -= OnPacketReceivedEvent;

    }

    private void Update()
    {
        //sphere.localPosition = (acc + offset) * multiplier;
        //sphere.localScale = new Vector3((acc.x * multiplier)+1, (acc.y * multiplier)+1, (acc.z * multiplier)+1);
        
    }

    private void OnPacketReceivedEvent(OSCServer sender, OSCPacket packet)
    {

        // Send something from PureData and it shows up in the Unity console
        if (packet.Address.StartsWith("/player/status")){
        	if(Int32.Parse(packet.Data[0].ToString()) == 1){
                //Player Connected!
                Debug.Log("Player Connected!");
				main.ConnectionPlayer(true);
            }
            else if (Int32.Parse(packet.Data[0].ToString()) == 0)
            {
                //Player disconnected
                Debug.Log("Player disconnected!");
				main.ConnectionPlayer(false);

            }

        }else if(packet.Address.StartsWith("/player/heartbeat/trigger")){
            //Player heartbeat trigger Detected
            Debug.Log("Heartbeat");
			main.HeartBeat(true);

        }else if(packet.Address.StartsWith("/player/heartbeat/bpm")){
            //New Heartbeat BPM is in packet.Data[0]
            float newBpm = float.Parse(packet.Data[0].ToString());
            Debug.Log("Heartbeat BPM: " + newBpm);
			main.SetBPM(newBpm);

        }else if(packet.Address.StartsWith("/player/activation")){
            //Overall player activation curve value is in packet.Data[0]
            // min is 0. max is 1.
            float activation = float.Parse(packet.Data[0].ToString());
            Debug.Log("Activation: " + activation);
        }if (packet.Address.StartsWith("/button/pressure/status")){
            if (Int32.Parse(packet.Data[0].ToString()) == 1)
            {
                //Rock lifted!
                Debug.Log("Pressure button " + packet.Data[0]);
				main.RockInPlace(false);

            }
            else if (Int32.Parse(packet.Data[0].ToString()) == 0)
            {
                //Rock in Place
                Debug.Log("Pressure button " + packet.Data[0]);
				main.RockInPlace(true);

            }

        }if (packet.Address.StartsWith("/button/right/status"))
        {
            if (Int32.Parse(packet.Data[0].ToString()) == 1)
            {
                Debug.Log("Right button " + packet.Data[0]);
				main.UpdateStateButtons(2,1);

            }
            else if (Int32.Parse(packet.Data[0].ToString()) == 0)
            {
                Debug.Log("Right button " + packet.Data[0]);
				main.UpdateStateButtons(2,0);
            }

        }if (packet.Address.StartsWith("/button/center/status"))
        {
            if (Int32.Parse(packet.Data[0].ToString()) == 1)
            {
                Debug.Log("Center button " + packet.Data[0]);
				main.UpdateStateButtons(1,1);

            }
            else if (Int32.Parse(packet.Data[0].ToString()) == 0)
            {
                Debug.Log("Center button " + packet.Data[0]);
				main.UpdateStateButtons(1,0);

            }

        } if (packet.Address.StartsWith("/button/left/status"))
        {
            if (Int32.Parse(packet.Data[0].ToString()) == 1)
            {
                Debug.Log("Left button " + packet.Data[0]);
				main.UpdateStateButtons(0,1);

            }
            else if (Int32.Parse(packet.Data[0].ToString()) == 0)
            {
                Debug.Log("Left button " + packet.Data[0]);
				main.UpdateStateButtons(0,0);

            }

        }
        //Debug.Log(packet.Address + ": " + DataToString(packet.Data));

    }
    public static string DataToString(List<object> data)
	{
		var buffer = "";
		
		for (int i = 0; i < data.Count; i++)
		{
			buffer += data[i] + " ";
		}
		
		return buffer;
	}

     void OnDestroy (){
        server.Close();
    }

}
