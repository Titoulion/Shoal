// Shader created with Shader Forge v1.17 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.17;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:False,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:True,qofs:100,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:3138,x:36519,y:31795,varname:node_3138,prsc:2|emission-6333-OUT,alpha-8657-OUT,voffset-2958-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:31460,y:32305,ptovrint:False,ptlb:MainColor1A,ptin:_MainColor1A,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.07843138,c2:0.3921569,c3:0.7843137,c4:1;n:type:ShaderForge.SFN_Color,id:3906,x:31732,y:32870,ptovrint:False,ptlb:MainColor2A,ptin:_MainColor2A,varname:node_3906,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_TexCoord,id:1083,x:32395,y:33253,varname:node_1083,prsc:2,uv:0;n:type:ShaderForge.SFN_Distance,id:4382,x:33152,y:33129,varname:node_4382,prsc:2|A-5460-OUT,B-3215-OUT;n:type:ShaderForge.SFN_Vector2,id:3215,x:33188,y:33355,varname:node_3215,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Multiply,id:7041,x:33351,y:33111,varname:node_7041,prsc:2|A-4382-OUT,B-7612-OUT;n:type:ShaderForge.SFN_Vector1,id:7612,x:33351,y:33219,varname:node_7612,prsc:2,v1:2;n:type:ShaderForge.SFN_If,id:7571,x:33799,y:32896,varname:node_7571,prsc:2|A-7041-OUT,B-7417-OUT,GT-6027-OUT,EQ-6027-OUT,LT-7417-OUT;n:type:ShaderForge.SFN_Vector1,id:7417,x:33799,y:33083,varname:node_7417,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:6027,x:33799,y:33032,varname:node_6027,prsc:2,v1:0;n:type:ShaderForge.SFN_Slider,id:487,x:32400,y:31889,ptovrint:False,ptlb:ExchangeColor,ptin:_ExchangeColor,varname:node_487,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1282051,max:1;n:type:ShaderForge.SFN_OneMinus,id:5694,x:32916,y:31906,varname:node_5694,prsc:2|IN-487-OUT;n:type:ShaderForge.SFN_Color,id:7027,x:31696,y:33037,ptovrint:False,ptlb:MainColor2B,ptin:_MainColor2B,varname:node_7027,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Slider,id:7556,x:31852,y:33182,ptovrint:False,ptlb:LerpColor2,ptin:_LerpColor2,varname:node_7556,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Lerp,id:2835,x:32106,y:32861,varname:node_2835,prsc:2|A-3906-RGB,B-7027-RGB,T-7556-OUT;n:type:ShaderForge.SFN_Slider,id:6062,x:31736,y:32613,ptovrint:False,ptlb:LerpColor1,ptin:_LerpColor1,varname:node_6062,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Color,id:2893,x:31460,y:32478,ptovrint:False,ptlb:MainColor1B,ptin:_MainColor1B,varname:node_2893,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Lerp,id:658,x:32087,y:32531,varname:node_658,prsc:2|A-7241-RGB,B-2893-RGB,T-6062-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:3242,x:36306,y:32431,varname:node_3242,prsc:2;n:type:ShaderForge.SFN_Subtract,id:8237,x:36657,y:32431,varname:node_8237,prsc:2|A-6964-XYZ,B-6069-XYZ;n:type:ShaderForge.SFN_ObjectPosition,id:6069,x:36657,y:32561,varname:node_6069,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:1763,x:36654,y:33051,ptovrint:False,ptlb:Size,ptin:_Size,varname:node_1763,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:8610,x:36839,y:32431,varname:node_8610,prsc:2|A-8237-OUT,B-5050-OUT;n:type:ShaderForge.SFN_Transform,id:6964,x:36484,y:32431,varname:node_6964,prsc:2,tffrom:0,tfto:1|IN-3242-XYZ;n:type:ShaderForge.SFN_Subtract,id:5050,x:36839,y:32577,varname:node_5050,prsc:2|A-9047-OUT,B-8888-OUT;n:type:ShaderForge.SFN_Vector1,id:8888,x:36853,y:32730,varname:node_8888,prsc:2,v1:1;n:type:ShaderForge.SFN_Add,id:2958,x:37024,y:32431,varname:node_2958,prsc:2|A-8610-OUT,B-5997-OUT;n:type:ShaderForge.SFN_Vector3,id:5997,x:37024,y:32551,varname:node_5997,prsc:2,v1:0,v2:0,v3:-0.1;n:type:ShaderForge.SFN_Relay,id:950,x:33100,y:32692,varname:node_950,prsc:2|IN-4260-OUT;n:type:ShaderForge.SFN_Add,id:6581,x:33716,y:32335,varname:node_6581,prsc:2|A-466-OUT,B-260-R;n:type:ShaderForge.SFN_Clamp01,id:1339,x:33870,y:32335,varname:node_1339,prsc:2|IN-6581-OUT;n:type:ShaderForge.SFN_Posterize,id:7653,x:34190,y:32377,varname:node_7653,prsc:2|IN-1339-OUT,STPS-206-OUT;n:type:ShaderForge.SFN_ValueProperty,id:206,x:34029,y:32465,ptovrint:False,ptlb:PosterizeValue,ptin:_PosterizeValue,varname:node_206,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Lerp,id:6920,x:34402,y:32097,varname:node_6920,prsc:2|A-9284-OUT,B-950-OUT,T-7653-OUT;n:type:ShaderForge.SFN_RemapRange,id:466,x:33419,y:32186,varname:node_466,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-5694-OUT;n:type:ShaderForge.SFN_Rotator,id:8329,x:33351,y:32795,varname:node_8329,prsc:2|UVIN-5460-OUT,ANG-9778-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9778,x:33162,y:32900,ptovrint:False,ptlb:RotationPerlin,ptin:_RotationPerlin,varname:node_9778,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Slider,id:6848,x:35410,y:32930,ptovrint:False,ptlb:PosInTail,ptin:_PosInTail,varname:node_6848,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Relay,id:9284,x:33238,y:32199,varname:node_9284,prsc:2|IN-3360-OUT;n:type:ShaderForge.SFN_Lerp,id:8609,x:32469,y:32273,varname:node_8609,prsc:2|A-658-OUT,B-2835-OUT,T-1614-OUT;n:type:ShaderForge.SFN_Lerp,id:7873,x:32523,y:32731,varname:node_7873,prsc:2|A-2835-OUT,B-658-OUT,T-1614-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:2016,x:32125,y:31734,ptovrint:False,ptlb:UseCustomGradient,ptin:_UseCustomGradient,varname:node_2016,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-8743-OUT,B-5122-OUT;n:type:ShaderForge.SFN_Color,id:5819,x:32893,y:32078,ptovrint:False,ptlb:CustomColorA,ptin:_CustomColorA,varname:node_5819,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Relay,id:5460,x:32906,y:32820,varname:node_5460,prsc:2|IN-1083-UVOUT;n:type:ShaderForge.SFN_Slider,id:7696,x:34952,y:32012,ptovrint:False,ptlb:Hunger,ptin:_Hunger,varname:node_7696,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:8657,x:35541,y:32548,varname:node_8657,prsc:2|A-5413-OUT,B-7571-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1614,x:32055,y:32374,ptovrint:False,ptlb:PointCurve,ptin:_PointCurve,varname:node_1614,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Desaturate,id:4815,x:35529,y:31816,varname:node_4815,prsc:2|COL-6920-OUT,DES-5300-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2027,x:35304,y:32409,ptovrint:False,ptlb:minAlpha,ptin:_minAlpha,varname:node_2027,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:2999,x:35481,y:32181,varname:node_2999,prsc:2|IN-7696-OUT,IMIN-956-OUT,IMAX-7733-OUT,OMIN-9866-OUT,OMAX-2027-OUT;n:type:ShaderForge.SFN_Vector1,id:7733,x:35304,y:32299,varname:node_7733,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:9866,x:35304,y:32335,varname:node_9866,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:956,x:35368,y:32093,varname:node_956,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:5553,x:35249,y:32539,varname:node_5553,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:9656,x:35791,y:32788,varname:node_9656,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:7619,x:35851,y:32869,varname:node_7619,prsc:2,v1:1;n:type:ShaderForge.SFN_Lerp,id:5413,x:36107,y:32824,varname:node_5413,prsc:2|A-7619-OUT,B-2999-OUT,T-1356-OUT;n:type:ShaderForge.SFN_Sin,id:2887,x:35626,y:33032,varname:node_2887,prsc:2|IN-3988-OUT;n:type:ShaderForge.SFN_Multiply,id:3988,x:35965,y:33087,varname:node_3988,prsc:2|A-2585-OUT,B-5524-OUT,C-6848-OUT;n:type:ShaderForge.SFN_Pi,id:2585,x:36160,y:33160,varname:node_2585,prsc:2;n:type:ShaderForge.SFN_Vector1,id:5524,x:35822,y:33254,varname:node_5524,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Add,id:9864,x:36204,y:32995,varname:node_9864,prsc:2|A-2887-OUT,B-2887-OUT;n:type:ShaderForge.SFN_Clamp01,id:1356,x:36413,y:33020,varname:node_1356,prsc:2|IN-9864-OUT;n:type:ShaderForge.SFN_Lerp,id:2602,x:36164,y:31615,varname:node_2602,prsc:2|A-6920-OUT,B-3124-OUT,T-7696-OUT;n:type:ShaderForge.SFN_Add,id:5408,x:35876,y:31807,varname:node_5408,prsc:2|A-4815-OUT,B-2207-OUT;n:type:ShaderForge.SFN_Vector1,id:5300,x:35247,y:31847,varname:node_5300,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector3,id:2207,x:35712,y:31908,varname:node_2207,prsc:2,v1:0.2,v2:0.2,v3:0.2;n:type:ShaderForge.SFN_Clamp01,id:3124,x:36046,y:31789,varname:node_3124,prsc:2|IN-5408-OUT;n:type:ShaderForge.SFN_Color,id:5523,x:32853,y:32493,ptovrint:False,ptlb:CustomColorB,ptin:_CustomColorB,varname:node_5523,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Vector1,id:8743,x:32111,y:31587,varname:node_8743,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:5122,x:32162,y:31664,varname:node_5122,prsc:2,v1:1;n:type:ShaderForge.SFN_Lerp,id:3360,x:32893,y:32246,varname:node_3360,prsc:2|A-8609-OUT,B-5819-RGB,T-2016-OUT;n:type:ShaderForge.SFN_Lerp,id:4260,x:32906,y:32648,varname:node_4260,prsc:2|A-7873-OUT,B-5523-RGB,T-2016-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3271,x:36185,y:31124,ptovrint:False,ptlb:ProgressDigestion,ptin:_ProgressDigestion,varname:node_3271,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:-0.5;n:type:ShaderForge.SFN_Abs,id:5031,x:36513,y:31154,varname:node_5031,prsc:2|IN-5151-OUT;n:type:ShaderForge.SFN_Subtract,id:5151,x:36348,y:31161,varname:node_5151,prsc:2|A-3271-OUT,B-6848-OUT;n:type:ShaderForge.SFN_If,id:9833,x:36957,y:31053,varname:node_9833,prsc:2|A-5031-OUT,B-5483-OUT,GT-2423-OUT,EQ-2423-OUT,LT-6551-OUT;n:type:ShaderForge.SFN_Vector1,id:5483,x:36513,y:31308,varname:node_5483,prsc:2,v1:0.4;n:type:ShaderForge.SFN_Vector1,id:2423,x:36722,y:31332,varname:node_2423,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:9324,x:36513,y:31060,varname:node_9324,prsc:2,v1:1;n:type:ShaderForge.SFN_Lerp,id:6333,x:36744,y:31688,varname:node_6333,prsc:2|A-2602-OUT,B-6700-OUT,T-9833-OUT;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:6551,x:36720,y:30963,varname:node_6551,prsc:2|IN-5031-OUT,IMIN-9438-OUT,IMAX-5483-OUT,OMIN-9324-OUT,OMAX-9438-OUT;n:type:ShaderForge.SFN_Vector1,id:9438,x:36447,y:31007,varname:node_9438,prsc:2,v1:0;n:type:ShaderForge.SFN_Blend,id:6700,x:36397,y:31477,varname:node_6700,prsc:2,blmd:8,clmp:False|SRC-2602-OUT,DST-7809-RGB;n:type:ShaderForge.SFN_Rotator,id:673,x:33543,y:32966,varname:node_673,prsc:2|UVIN-5460-OUT,ANG-5407-OUT;n:type:ShaderForge.SFN_Add,id:5407,x:33351,y:32942,varname:node_5407,prsc:2|A-9778-OUT,B-4531-OUT;n:type:ShaderForge.SFN_Vector1,id:4531,x:33185,y:32976,varname:node_4531,prsc:2,v1:1.25;n:type:ShaderForge.SFN_Tex2dAsset,id:4213,x:33435,y:32635,ptovrint:False,ptlb:Perlin,ptin:_Perlin,varname:node_4213,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:260,x:33619,y:32584,varname:node_260,prsc:2,ntxv:0,isnm:False|UVIN-8329-UVOUT,TEX-4213-TEX;n:type:ShaderForge.SFN_Tex2d,id:7809,x:33840,y:32618,varname:node_7809,prsc:2,ntxv:0,isnm:False|UVIN-673-UVOUT,TEX-4213-TEX;n:type:ShaderForge.SFN_Multiply,id:3346,x:36776,y:32812,varname:node_3346,prsc:2|A-9833-OUT,B-5354-OUT;n:type:ShaderForge.SFN_Vector1,id:5354,x:37150,y:31471,varname:node_5354,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Add,id:9047,x:36868,y:32963,varname:node_9047,prsc:2|A-1763-OUT,B-3346-OUT;proporder:7241-3906-487-7027-7556-6062-2893-1763-206-9778-6848-2016-5819-7696-1614-2027-5523-3271-4213;pass:END;sub:END;*/

Shader "Shader Forge/ScaleShader" {
    Properties {
        _MainColor1A ("MainColor1A", Color) = (0.07843138,0.3921569,0.7843137,1)
        _MainColor2A ("MainColor2A", Color) = (0.5,0.5,0.5,1)
        _ExchangeColor ("ExchangeColor", Range(0, 1)) = 0.1282051
        _MainColor2B ("MainColor2B", Color) = (0.5,0.5,0.5,1)
        _LerpColor2 ("LerpColor2", Range(0, 1)) = 0
        _LerpColor1 ("LerpColor1", Range(0, 1)) = 0
        _MainColor1B ("MainColor1B", Color) = (0.5,0.5,0.5,1)
        _Size ("Size", Float ) = 1
        _PosterizeValue ("PosterizeValue", Float ) = 0
        _RotationPerlin ("RotationPerlin", Float ) = 0
        _PosInTail ("PosInTail", Range(0, 1)) = 0
        [MaterialToggle] _UseCustomGradient ("UseCustomGradient", Float ) = 0
        _CustomColorA ("CustomColorA", Color) = (0.5,0.5,0.5,1)
        _Hunger ("Hunger", Range(0, 1)) = 0
        _PointCurve ("PointCurve", Float ) = 0
        _minAlpha ("minAlpha", Float ) = 0
        _CustomColorB ("CustomColorB", Color) = (0.5,0.5,0.5,1)
        _ProgressDigestion ("ProgressDigestion", Float ) = -0.5
        _Perlin ("Perlin", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent+100"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _MainColor1A;
            uniform float4 _MainColor2A;
            uniform float _ExchangeColor;
            uniform float4 _MainColor2B;
            uniform float _LerpColor2;
            uniform float _LerpColor1;
            uniform float4 _MainColor1B;
            uniform float _Size;
            uniform float _PosterizeValue;
            uniform float _RotationPerlin;
            uniform float _PosInTail;
            uniform fixed _UseCustomGradient;
            uniform float4 _CustomColorA;
            uniform float _Hunger;
            uniform float _PointCurve;
            uniform float _minAlpha;
            uniform float4 _CustomColorB;
            uniform float _ProgressDigestion;
            uniform sampler2D _Perlin; uniform float4 _Perlin_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float4 objPos = mul ( _Object2World, float4(0,0,0,1) );
                float node_5031 = abs((_ProgressDigestion-_PosInTail));
                float node_5483 = 0.4;
                float node_9833_if_leA = step(node_5031,node_5483);
                float node_9833_if_leB = step(node_5483,node_5031);
                float node_9438 = 0.0;
                float node_9324 = 1.0;
                float node_2423 = 0.0;
                float node_9833 = lerp((node_9833_if_leA*(node_9324 + ( (node_5031 - node_9438) * (node_9438 - node_9324) ) / (node_5483 - node_9438)))+(node_9833_if_leB*node_2423),node_2423,node_9833_if_leA*node_9833_if_leB);
                v.vertex.xyz += (((mul( _World2Object, float4(mul(_Object2World, v.vertex).rgb,0) ).xyz.rgb-objPos.rgb)*((_Size+(node_9833*0.5))-1.0))+float3(0,0,-0.1));
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( _Object2World, float4(0,0,0,1) );
/////// Vectors:
////// Lighting:
////// Emissive:
                float3 node_658 = lerp(_MainColor1A.rgb,_MainColor1B.rgb,_LerpColor1);
                float3 node_2835 = lerp(_MainColor2A.rgb,_MainColor2B.rgb,_LerpColor2);
                float _UseCustomGradient_var = lerp( 0.0, 1.0, _UseCustomGradient );
                float node_8329_ang = _RotationPerlin;
                float node_8329_spd = 1.0;
                float node_8329_cos = cos(node_8329_spd*node_8329_ang);
                float node_8329_sin = sin(node_8329_spd*node_8329_ang);
                float2 node_8329_piv = float2(0.5,0.5);
                float2 node_5460 = i.uv0;
                float2 node_8329 = (mul(node_5460-node_8329_piv,float2x2( node_8329_cos, -node_8329_sin, node_8329_sin, node_8329_cos))+node_8329_piv);
                float4 node_260 = tex2D(_Perlin,TRANSFORM_TEX(node_8329, _Perlin));
                float3 node_6920 = lerp(lerp(lerp(node_658,node_2835,_PointCurve),_CustomColorA.rgb,_UseCustomGradient_var),lerp(lerp(node_2835,node_658,_PointCurve),_CustomColorB.rgb,_UseCustomGradient_var),floor(saturate((((1.0 - _ExchangeColor)*2.0+-1.0)+node_260.r)) * _PosterizeValue) / (_PosterizeValue - 1));
                float3 node_2602 = lerp(node_6920,saturate((lerp(node_6920,dot(node_6920,float3(0.3,0.59,0.11)),1.0)+float3(0.2,0.2,0.2))),_Hunger);
                float node_673_ang = (_RotationPerlin+1.25);
                float node_673_spd = 1.0;
                float node_673_cos = cos(node_673_spd*node_673_ang);
                float node_673_sin = sin(node_673_spd*node_673_ang);
                float2 node_673_piv = float2(0.5,0.5);
                float2 node_673 = (mul(node_5460-node_673_piv,float2x2( node_673_cos, -node_673_sin, node_673_sin, node_673_cos))+node_673_piv);
                float4 node_7809 = tex2D(_Perlin,TRANSFORM_TEX(node_673, _Perlin));
                float node_5031 = abs((_ProgressDigestion-_PosInTail));
                float node_5483 = 0.4;
                float node_9833_if_leA = step(node_5031,node_5483);
                float node_9833_if_leB = step(node_5483,node_5031);
                float node_9438 = 0.0;
                float node_9324 = 1.0;
                float node_2423 = 0.0;
                float node_9833 = lerp((node_9833_if_leA*(node_9324 + ( (node_5031 - node_9438) * (node_9438 - node_9324) ) / (node_5483 - node_9438)))+(node_9833_if_leB*node_2423),node_2423,node_9833_if_leA*node_9833_if_leB);
                float3 emissive = lerp(node_2602,(node_2602+node_7809.rgb),node_9833);
                float3 finalColor = emissive;
                float node_956 = 0.0;
                float node_9866 = 1.0;
                float node_2887 = sin((3.141592654*0.5*_PosInTail));
                float node_7417 = 1.0;
                float node_7571_if_leA = step((distance(node_5460,float2(0.5,0.5))*2.0),node_7417);
                float node_7571_if_leB = step(node_7417,(distance(node_5460,float2(0.5,0.5))*2.0));
                float node_6027 = 0.0;
                return fixed4(finalColor,(lerp(1.0,(node_9866 + ( (_Hunger - node_956) * (_minAlpha - node_9866) ) / (1.0 - node_956)),saturate((node_2887+node_2887)))*lerp((node_7571_if_leA*node_7417)+(node_7571_if_leB*node_6027),node_6027,node_7571_if_leA*node_7571_if_leB)));
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float _Size;
            uniform float _PosInTail;
            uniform float _ProgressDigestion;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float4 posWorld : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                float4 objPos = mul ( _Object2World, float4(0,0,0,1) );
                float node_5031 = abs((_ProgressDigestion-_PosInTail));
                float node_5483 = 0.4;
                float node_9833_if_leA = step(node_5031,node_5483);
                float node_9833_if_leB = step(node_5483,node_5031);
                float node_9438 = 0.0;
                float node_9324 = 1.0;
                float node_2423 = 0.0;
                float node_9833 = lerp((node_9833_if_leA*(node_9324 + ( (node_5031 - node_9438) * (node_9438 - node_9324) ) / (node_5483 - node_9438)))+(node_9833_if_leB*node_2423),node_2423,node_9833_if_leA*node_9833_if_leB);
                v.vertex.xyz += (((mul( _World2Object, float4(mul(_Object2World, v.vertex).rgb,0) ).xyz.rgb-objPos.rgb)*((_Size+(node_9833*0.5))-1.0))+float3(0,0,-0.1));
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( _Object2World, float4(0,0,0,1) );
/////// Vectors:
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
