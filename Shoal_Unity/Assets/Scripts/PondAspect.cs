﻿using UnityEngine;
using System.Collections;
using System.Linq;

public class PondAspect : MonoBehaviour {

	private Material myMat;
	private float progressDistort;
	private float progressDay;
	private float speedDistort;
	[SerializeField] private EnemyScript theEnemy;
	[SerializeField] private AnimationCurve curveDistort;
	[SerializeField] private float durationDay = 10f;
	[SerializeField] private Camera camRenderFish;
	[SerializeField] private Gradient rampColorsEdgePond;
	[SerializeField] private Gradient rampColorsFondPond;
	[SerializeField] private Gradient rampColorsWaves;
	[SerializeField] private Gradient rampColorsFoodOff;
	[SerializeField] private Gradient rampColorsFoodOn;
	[SerializeField] private Gradient rampColorsRipples;

	void Start () 
	{
		myMat = GetComponent<Renderer>().material;
		Shader.SetGlobalFloat("_GlobalOpacity", 1f);

	}

	void SpawnInitBoulder(float _x, float _y, float rad)
	{
		GameObject bould = Spawner.Instance.SpawnBoulder(new Vector2(_x,_y));
		bould.transform.localScale = Vector3.one*rad;
		bould.GetComponent<Stone>().radius = rad/2f;
	}

	void Update () 
	{
		UpdatePondAspect();
	//	Debug.Log (Input.mousePosition.x/Screen.height+"    "+Input.mousePosition.x/Screen.height);
	}

	private void UpdatePondAspect()
	{
		progressDay+=Time.deltaTime/durationDay;
		progressDay = MyHelper.Modulo (progressDay,1f);
		
		Color col1 = rampColorsEdgePond.Evaluate(progressDay);
		Color col2 = rampColorsFondPond.Evaluate(progressDay);
		Color col3 = rampColorsWaves.Evaluate(progressDay);
		Color col4 = rampColorsFoodOff.Evaluate(progressDay);
		Color col5 = rampColorsFoodOn.Evaluate(progressDay);
		Color col6 = rampColorsRipples.Evaluate(progressDay);

		myMat.SetColor ("_ColorBlendRamp",col1);
		Shader.SetGlobalColor("_ColorGlobal2",col1);
		camRenderFish.backgroundColor = col2;
		Shader.SetGlobalColor("_ColorGlobal",col2);
		Shader.SetGlobalColor("_ColorGlobal3",col3);
		Shader.SetGlobalColor("_ColorGlobal4",col4);
		Shader.SetGlobalColor("_ColorGlobal5",col5);
		Shader.SetGlobalColor("_ColorGlobal6",col6);

		speedDistort = 0.02f+0.007f*(Pond.Instance.GetEntitiesOfType(EntityType.Fish).Count());
		progressDistort+=speedDistort;
		myMat.SetFloat("_ProgressDistort",progressDistort);
		myMat.SetFloat("_Distort", MyHelper.Map (curveDistort.Evaluate(theEnemy.GetSpawnStatus()),0f,1f,0.16f,1.1f));
	}
}
