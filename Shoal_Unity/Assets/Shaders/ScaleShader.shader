// Shader created with Shader Forge v1.17 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.17;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:False,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:True,qofs:100,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:3138,x:38506,y:31988,varname:node_3138,prsc:2|emission-6333-OUT,alpha-8657-OUT,voffset-2958-OUT;n:type:ShaderForge.SFN_TexCoord,id:1083,x:34746,y:32678,varname:node_1083,prsc:2,uv:0;n:type:ShaderForge.SFN_Distance,id:4382,x:36549,y:32813,varname:node_4382,prsc:2|A-1083-UVOUT,B-3215-OUT;n:type:ShaderForge.SFN_Vector2,id:3215,x:36549,y:32937,varname:node_3215,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Multiply,id:7041,x:36743,y:32813,varname:node_7041,prsc:2|A-4382-OUT,B-7612-OUT;n:type:ShaderForge.SFN_Vector1,id:7612,x:36743,y:32937,varname:node_7612,prsc:2,v1:2;n:type:ShaderForge.SFN_If,id:7571,x:36975,y:32806,varname:node_7571,prsc:2|A-7041-OUT,B-7417-OUT,GT-6027-OUT,EQ-6027-OUT,LT-7417-OUT;n:type:ShaderForge.SFN_Vector1,id:7417,x:36975,y:32982,varname:node_7417,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:6027,x:36975,y:32930,varname:node_6027,prsc:2,v1:0;n:type:ShaderForge.SFN_Slider,id:487,x:34580,y:31919,ptovrint:False,ptlb:ExchangeColor,ptin:_ExchangeColor,varname:node_487,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1282051,max:1;n:type:ShaderForge.SFN_FragmentPosition,id:3242,x:37831,y:32544,varname:node_3242,prsc:2;n:type:ShaderForge.SFN_Subtract,id:8237,x:38158,y:32547,varname:node_8237,prsc:2|A-6964-XYZ,B-6069-XYZ;n:type:ShaderForge.SFN_ObjectPosition,id:6069,x:38008,y:32603,varname:node_6069,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:1763,x:37652,y:32828,ptovrint:False,ptlb:Size,ptin:_Size,varname:node_1763,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:8610,x:38008,y:32803,varname:node_8610,prsc:2|A-8237-OUT,B-9047-OUT;n:type:ShaderForge.SFN_Transform,id:6964,x:38008,y:32444,varname:node_6964,prsc:2,tffrom:0,tfto:1|IN-3242-XYZ;n:type:ShaderForge.SFN_Vector1,id:8888,x:37652,y:32889,varname:node_8888,prsc:2,v1:-1;n:type:ShaderForge.SFN_Add,id:2958,x:38214,y:32803,varname:node_2958,prsc:2|A-8610-OUT,B-5997-OUT;n:type:ShaderForge.SFN_Vector3,id:5997,x:38214,y:32923,varname:node_5997,prsc:2,v1:0,v2:0,v3:0;n:type:ShaderForge.SFN_Add,id:6581,x:35487,y:31955,varname:node_6581,prsc:2|A-466-OUT,B-260-R;n:type:ShaderForge.SFN_Clamp01,id:1339,x:35661,y:31955,varname:node_1339,prsc:2|IN-6581-OUT;n:type:ShaderForge.SFN_Posterize,id:7653,x:35859,y:31955,varname:node_7653,prsc:2|IN-1339-OUT,STPS-206-OUT;n:type:ShaderForge.SFN_ValueProperty,id:206,x:35846,y:31899,ptovrint:False,ptlb:PosterizeValue,ptin:_PosterizeValue,varname:node_206,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Lerp,id:6920,x:35848,y:31509,varname:node_6920,prsc:2|A-5819-RGB,B-5523-RGB,T-7653-OUT;n:type:ShaderForge.SFN_RemapRange,id:466,x:34906,y:31919,varname:node_466,prsc:2,frmn:1,frmx:0,tomn:-1,tomx:1|IN-487-OUT;n:type:ShaderForge.SFN_Rotator,id:8329,x:35234,y:32130,varname:node_8329,prsc:2|UVIN-1083-UVOUT,ANG-9778-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9778,x:35151,y:32283,ptovrint:False,ptlb:RotationPerlin,ptin:_RotationPerlin,varname:node_9778,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Slider,id:6848,x:36276,y:32450,ptovrint:False,ptlb:PosInTail,ptin:_PosInTail,varname:node_6848,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Color,id:5819,x:35540,y:31349,ptovrint:False,ptlb:CustomColorA,ptin:_CustomColorA,varname:node_5819,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Slider,id:7696,x:36294,y:32032,ptovrint:False,ptlb:Hunger,ptin:_Hunger,varname:node_7696,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:8657,x:37281,y:32533,varname:node_8657,prsc:2|A-5413-OUT,B-7571-OUT;n:type:ShaderForge.SFN_Desaturate,id:4815,x:36028,y:31619,varname:node_4815,prsc:2|COL-6920-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2027,x:36588,y:32296,ptovrint:False,ptlb:minAlpha,ptin:_minAlpha,varname:node_2027,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:2999,x:36791,y:32162,varname:node_2999,prsc:2|IN-7696-OUT,IMIN-956-OUT,IMAX-9866-OUT,OMIN-9866-OUT,OMAX-2027-OUT;n:type:ShaderForge.SFN_Vector1,id:9866,x:36588,y:32225,varname:node_9866,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:956,x:36588,y:32161,varname:node_956,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:7619,x:37109,y:32459,varname:node_7619,prsc:2,v1:1;n:type:ShaderForge.SFN_Lerp,id:5413,x:37109,y:32533,varname:node_5413,prsc:2|A-7619-OUT,B-2999-OUT,T-1356-OUT;n:type:ShaderForge.SFN_Sin,id:2887,x:36568,y:32582,varname:node_2887,prsc:2|IN-3988-OUT;n:type:ShaderForge.SFN_Multiply,id:3988,x:36414,y:32582,varname:node_3988,prsc:2|A-2585-OUT,B-5524-OUT,C-6848-OUT;n:type:ShaderForge.SFN_Pi,id:2585,x:36219,y:32637,varname:node_2585,prsc:2;n:type:ShaderForge.SFN_Vector1,id:5524,x:36203,y:32582,varname:node_5524,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Add,id:9864,x:36720,y:32582,varname:node_9864,prsc:2|A-2887-OUT,B-2887-OUT;n:type:ShaderForge.SFN_Clamp01,id:1356,x:36907,y:32568,varname:node_1356,prsc:2|IN-9864-OUT;n:type:ShaderForge.SFN_Lerp,id:2602,x:36714,y:31567,varname:node_2602,prsc:2|A-6920-OUT,B-3124-OUT,T-7696-OUT;n:type:ShaderForge.SFN_Add,id:5408,x:36229,y:31619,varname:node_5408,prsc:2|A-4815-OUT,B-2207-OUT;n:type:ShaderForge.SFN_Vector3,id:2207,x:36217,y:31777,varname:node_2207,prsc:2,v1:0.2,v2:0.2,v3:0.2;n:type:ShaderForge.SFN_Clamp01,id:3124,x:36400,y:31619,varname:node_3124,prsc:2|IN-5408-OUT;n:type:ShaderForge.SFN_Color,id:5523,x:35540,y:31556,ptovrint:False,ptlb:CustomColorB,ptin:_CustomColorB,varname:node_5523,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Vector1,id:8743,x:31773,y:31639,varname:node_8743,prsc:2,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:3271,x:37260,y:32048,ptovrint:False,ptlb:ProgressDigestion,ptin:_ProgressDigestion,varname:node_3271,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:-0.5;n:type:ShaderForge.SFN_Abs,id:5031,x:37470,y:31867,varname:node_5031,prsc:2|IN-5151-OUT;n:type:ShaderForge.SFN_Subtract,id:5151,x:37290,y:31867,varname:node_5151,prsc:2|A-6848-OUT,B-3271-OUT;n:type:ShaderForge.SFN_If,id:9833,x:37822,y:31861,varname:node_9833,prsc:2|A-5031-OUT,B-5483-OUT,GT-2423-OUT,EQ-2423-OUT,LT-6551-OUT;n:type:ShaderForge.SFN_Vector1,id:5483,x:37470,y:32024,varname:node_5483,prsc:2,v1:0.4;n:type:ShaderForge.SFN_Vector1,id:2423,x:37822,y:32006,varname:node_2423,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:9324,x:37470,y:32148,varname:node_9324,prsc:2,v1:1;n:type:ShaderForge.SFN_Lerp,id:6333,x:38086,y:31675,varname:node_6333,prsc:2|A-2602-OUT,B-6700-OUT,T-9833-OUT;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:6551,x:37670,y:32044,varname:node_6551,prsc:2|IN-5031-OUT,IMIN-9438-OUT,IMAX-5483-OUT,OMIN-9324-OUT,OMAX-9438-OUT;n:type:ShaderForge.SFN_Vector1,id:9438,x:37470,y:32088,varname:node_9438,prsc:2,v1:0;n:type:ShaderForge.SFN_Blend,id:6700,x:37129,y:31703,varname:node_6700,prsc:2,blmd:8,clmp:False|SRC-2602-OUT,DST-7809-RGB;n:type:ShaderForge.SFN_Rotator,id:673,x:35827,y:32224,varname:node_673,prsc:2|UVIN-1083-UVOUT,ANG-5407-OUT;n:type:ShaderForge.SFN_Add,id:5407,x:35658,y:32294,varname:node_5407,prsc:2|A-9778-OUT,B-4531-OUT;n:type:ShaderForge.SFN_Vector1,id:4531,x:35486,y:32354,varname:node_4531,prsc:2,v1:1.25;n:type:ShaderForge.SFN_Tex2dAsset,id:4213,x:35119,y:32374,ptovrint:False,ptlb:Perlin,ptin:_Perlin,varname:node_4213,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:260,x:35442,y:32130,varname:node_260,prsc:2,ntxv:0,isnm:False|UVIN-8329-UVOUT,TEX-4213-TEX;n:type:ShaderForge.SFN_Tex2d,id:7809,x:35953,y:32423,varname:node_7809,prsc:2,ntxv:0,isnm:False|UVIN-673-UVOUT,TEX-4213-TEX;n:type:ShaderForge.SFN_Multiply,id:3346,x:37652,y:32661,varname:node_3346,prsc:2|A-5354-OUT,B-9833-OUT;n:type:ShaderForge.SFN_Vector1,id:5354,x:37652,y:32608,varname:node_5354,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Add,id:9047,x:37822,y:32828,varname:node_9047,prsc:2|A-1763-OUT,B-3346-OUT,C-8888-OUT;proporder:487-1763-206-9778-6848-5819-7696-2027-5523-3271-4213;pass:END;sub:END;*/

Shader "Shader Forge/ScaleShader" {
    Properties {
        _ExchangeColor ("ExchangeColor", Range(0, 1)) = 0.1282051
        _Size ("Size", Float ) = 1
        _PosterizeValue ("PosterizeValue", Float ) = 0
        _RotationPerlin ("RotationPerlin", Float ) = 0
        _PosInTail ("PosInTail", Range(0, 1)) = 0
        _CustomColorA ("CustomColorA", Color) = (0.5,0.5,0.5,1)
        _Hunger ("Hunger", Range(0, 1)) = 0
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
            uniform float _ExchangeColor;
            uniform float _Size;
            uniform float _PosterizeValue;
            uniform float _RotationPerlin;
            uniform float _PosInTail;
            uniform float4 _CustomColorA;
            uniform float _Hunger;
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
                float node_5031 = abs((_PosInTail-_ProgressDigestion));
                float node_5483 = 0.4;
                float node_9833_if_leA = step(node_5031,node_5483);
                float node_9833_if_leB = step(node_5483,node_5031);
                float node_9438 = 0.0;
                float node_9324 = 1.0;
                float node_2423 = 0.0;
                float node_9833 = lerp((node_9833_if_leA*(node_9324 + ( (node_5031 - node_9438) * (node_9438 - node_9324) ) / (node_5483 - node_9438)))+(node_9833_if_leB*node_2423),node_2423,node_9833_if_leA*node_9833_if_leB);
                v.vertex.xyz += (((mul( _World2Object, float4(mul(_Object2World, v.vertex).rgb,0) ).xyz.rgb-objPos.rgb)*(_Size+(0.5*node_9833)+(-1.0)))+float3(0,0,0));
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( _Object2World, float4(0,0,0,1) );
/////// Vectors:
////// Lighting:
////// Emissive:
                float node_8329_ang = _RotationPerlin;
                float node_8329_spd = 1.0;
                float node_8329_cos = cos(node_8329_spd*node_8329_ang);
                float node_8329_sin = sin(node_8329_spd*node_8329_ang);
                float2 node_8329_piv = float2(0.5,0.5);
                float2 node_8329 = (mul(i.uv0-node_8329_piv,float2x2( node_8329_cos, -node_8329_sin, node_8329_sin, node_8329_cos))+node_8329_piv);
                float4 node_260 = tex2D(_Perlin,TRANSFORM_TEX(node_8329, _Perlin));
                float3 node_6920 = lerp(_CustomColorA.rgb,_CustomColorB.rgb,floor(saturate(((_ExchangeColor*-2.0+1.0)+node_260.r)) * _PosterizeValue) / (_PosterizeValue - 1));
                float3 node_2602 = lerp(node_6920,saturate((dot(node_6920,float3(0.3,0.59,0.11))+float3(0.2,0.2,0.2))),_Hunger);
                float node_673_ang = (_RotationPerlin+1.25);
                float node_673_spd = 1.0;
                float node_673_cos = cos(node_673_spd*node_673_ang);
                float node_673_sin = sin(node_673_spd*node_673_ang);
                float2 node_673_piv = float2(0.5,0.5);
                float2 node_673 = (mul(i.uv0-node_673_piv,float2x2( node_673_cos, -node_673_sin, node_673_sin, node_673_cos))+node_673_piv);
                float4 node_7809 = tex2D(_Perlin,TRANSFORM_TEX(node_673, _Perlin));
                float node_5031 = abs((_PosInTail-_ProgressDigestion));
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
                float node_7571_if_leA = step((distance(i.uv0,float2(0.5,0.5))*2.0),node_7417);
                float node_7571_if_leB = step(node_7417,(distance(i.uv0,float2(0.5,0.5))*2.0));
                float node_6027 = 0.0;
                return fixed4(finalColor,(lerp(1.0,(node_9866 + ( (_Hunger - node_956) * (_minAlpha - node_9866) ) / (node_9866 - node_956)),saturate((node_2887+node_2887)))*lerp((node_7571_if_leA*node_7417)+(node_7571_if_leB*node_6027),node_6027,node_7571_if_leA*node_7571_if_leB)));
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
                float node_5031 = abs((_PosInTail-_ProgressDigestion));
                float node_5483 = 0.4;
                float node_9833_if_leA = step(node_5031,node_5483);
                float node_9833_if_leB = step(node_5483,node_5031);
                float node_9438 = 0.0;
                float node_9324 = 1.0;
                float node_2423 = 0.0;
                float node_9833 = lerp((node_9833_if_leA*(node_9324 + ( (node_5031 - node_9438) * (node_9438 - node_9324) ) / (node_5483 - node_9438)))+(node_9833_if_leB*node_2423),node_2423,node_9833_if_leA*node_9833_if_leB);
                v.vertex.xyz += (((mul( _World2Object, float4(mul(_Object2World, v.vertex).rgb,0) ).xyz.rgb-objPos.rgb)*(_Size+(0.5*node_9833)+(-1.0)))+float3(0,0,0));
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
