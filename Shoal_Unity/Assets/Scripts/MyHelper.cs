using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Xml.Serialization;
using UnityEngine;
using Object = UnityEngine.Object;

public static class MyHelper
{
	public static float Map(float val, float fromMin, float fromMax, float toMin, float toMax) {
		return ((val - fromMin) / (fromMax - fromMin)) * (toMax - toMin) + toMin;
	}
	
	public static float Modulo(float a,float b)
	{
		return a - b * Mathf.Floor(a / b);
	}
}
