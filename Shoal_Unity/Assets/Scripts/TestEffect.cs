using UnityEngine;
using System.Collections;

public class TestEffect : MonoBehaviour {

	public Material mat;
	void OnRenderImage(RenderTexture src, RenderTexture dest) {



		Graphics.Blit(src, dest, mat);
	}

}
