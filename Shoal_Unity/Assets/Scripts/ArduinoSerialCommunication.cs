
using UnityEngine;
using System.Collections;
using System.IO.Ports;
using UnityEngine.UI;

public class ArduinoSerialCommunication: MonoBehaviour {
	

	

	public string portName = "COM1";
	



	
	SerialPort myPort;


	public bool useDifferentThread = true;
	
	
	
	
	void Awake()
	{

	}
	

	void Start () 
	{
		InitSerials();
	}
	
	private void InitSerials() 
	{
		
	
			myPort = new SerialPort(portName,9600, Parity.None, 8, StopBits.One);
			

		try{
				myPort.Open();
				myPort.ReadTimeout = 50;

				if(useDifferentThread)
				{
					StartCoroutine(ReadSerial());
				}
				else
				{
					myPort.DataReceived += new SerialDataReceivedEventHandler(DataReceivedHandler);
				}
	
			}
			catch(System.Exception ex)
			{
			Debug.Log (ex);
				//Debug.Log ("The port "+portName+" doesn't exist");
			}


	}

	IEnumerator ReadSerial()
	{



		while(true)
		{
			try 
			{
				string line = myPort.ReadLine();
				ReadCode(line);
			}
			catch(System.Exception)
			{

			}

			yield return new WaitForSeconds(0.1f);
		}
	}
	
	private static void DataReceivedHandler(object sender,SerialDataReceivedEventArgs e)
	{

	
		SerialPort sp = (SerialPort)sender;

		if(sp.PortName=="COM1")
		{

			string line = sp.ReadLine();
			ReadCode(line);
		}

	}


	private static void ReadCode(string _code)
	{
		MainScript.Instance.GetMessageFromArduino(int.Parse(_code));
	}

	
	void Update () 
	{
		


		
	}
}