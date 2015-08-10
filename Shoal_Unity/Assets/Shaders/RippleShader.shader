// Shader created with Shader Forge v1.17 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.17;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:True,qofs:100,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:3138,x:43598,y:31682,varname:node_3138,prsc:2|emission-9347-OUT,alpha-4939-OUT,voffset-7837-OUT;n:type:ShaderForge.SFN_Vector1,id:425,x:41829,y:31914,varname:node_425,prsc:2,v1:0;n:type:ShaderForge.SFN_Tex2d,id:3748,x:43204,y:31069,ptovrint:False,ptlb:TextureWave,ptin:_TextureWave,varname:node_3748,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:9197,x:41003,y:31948,varname:node_9197,prsc:2,uv:0;n:type:ShaderForge.SFN_Distance,id:4243,x:41252,y:31975,varname:node_4243,prsc:2|A-9197-UVOUT,B-8249-OUT;n:type:ShaderForge.SFN_Vector2,id:8249,x:41054,y:32108,varname:node_8249,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Multiply,id:509,x:41398,y:31940,varname:node_509,prsc:2|A-4243-OUT,B-7870-OUT;n:type:ShaderForge.SFN_Vector1,id:7870,x:41398,y:32072,varname:node_7870,prsc:2,v1:2;n:type:ShaderForge.SFN_If,id:7311,x:42198,y:32077,varname:node_7311,prsc:2|A-4420-OUT,B-3027-OUT,GT-425-OUT,EQ-7382-OUT,LT-7382-OUT;n:type:ShaderForge.SFN_Abs,id:4420,x:41794,y:32028,varname:node_4420,prsc:2|IN-4413-OUT;n:type:ShaderForge.SFN_Subtract,id:4413,x:41603,y:31970,varname:node_4413,prsc:2|A-509-OUT,B-3537-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3537,x:41548,y:32131,ptovrint:False,ptlb:DistanceWave,ptin:_DistanceWave,varname:node_3537,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.7;n:type:ShaderForge.SFN_ValueProperty,id:4036,x:41667,y:32227,ptovrint:False,ptlb:WaveWidth,ptin:_WaveWidth,varname:node_4036,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.2;n:type:ShaderForge.SFN_Vector1,id:200,x:41834,y:32445,varname:node_200,prsc:2,v1:1;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:8124,x:42087,y:32312,varname:node_8124,prsc:2|IN-4420-OUT,IMIN-6568-OUT,IMAX-3027-OUT,OMIN-200-OUT,OMAX-6568-OUT;n:type:ShaderForge.SFN_Vector1,id:6568,x:41805,y:32378,varname:node_6568,prsc:2,v1:0;n:type:ShaderForge.SFN_Sin,id:7382,x:42432,y:32329,varname:node_7382,prsc:2|IN-88-OUT;n:type:ShaderForge.SFN_Multiply,id:88,x:42288,y:32379,varname:node_88,prsc:2|A-8124-OUT,B-8463-OUT,C-5215-OUT;n:type:ShaderForge.SFN_Vector1,id:8463,x:42087,y:32467,varname:node_8463,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Pi,id:5215,x:42197,y:32493,varname:node_5215,prsc:2;n:type:ShaderForge.SFN_FragmentPosition,id:3755,x:42659,y:32440,varname:node_3755,prsc:2;n:type:ShaderForge.SFN_Subtract,id:9173,x:43073,y:32423,varname:node_9173,prsc:2|A-5049-XYZ,B-2061-XYZ;n:type:ShaderForge.SFN_ObjectPosition,id:2061,x:42973,y:32581,varname:node_2061,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:3399,x:42636,y:32874,ptovrint:False,ptlb:SizeMax,ptin:_SizeMax,varname:_Size_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:7837,x:43255,y:32423,varname:node_7837,prsc:2|A-9173-OUT,B-750-OUT;n:type:ShaderForge.SFN_Transform,id:5049,x:42861,y:32423,varname:node_5049,prsc:2,tffrom:0,tfto:1|IN-3755-XYZ;n:type:ShaderForge.SFN_Subtract,id:750,x:43255,y:32569,varname:node_750,prsc:2|A-2101-OUT,B-5062-OUT;n:type:ShaderForge.SFN_Vector1,id:5062,x:43106,y:32705,varname:node_5062,prsc:2,v1:1;n:type:ShaderForge.SFN_Slider,id:7786,x:42035,y:31820,ptovrint:False,ptlb:Progress,ptin:_Progress,varname:node_7786,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:4939,x:43122,y:31965,varname:node_4939,prsc:2|A-9726-OUT,B-7311-OUT;n:type:ShaderForge.SFN_Multiply,id:1833,x:42843,y:31799,varname:node_1833,prsc:2|A-3761-OUT,B-820-OUT;n:type:ShaderForge.SFN_Pi,id:820,x:42744,y:31935,varname:node_820,prsc:2;n:type:ShaderForge.SFN_Sin,id:9726,x:43042,y:31774,varname:node_9726,prsc:2|IN-1833-OUT;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:30,x:42754,y:31452,varname:node_30,prsc:2|IN-7786-OUT,IMIN-7521-OUT,IMAX-7030-OUT,OMIN-7521-OUT,OMAX-4451-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7030,x:42469,y:31611,ptovrint:False,ptlb:ValueMiddle,ptin:_ValueMiddle,varname:node_7030,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Vector1,id:7521,x:42511,y:31383,varname:node_7521,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:6288,x:42448,y:31512,varname:node_6288,prsc:2,v1:1;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:2398,x:42989,y:31547,varname:node_2398,prsc:2|IN-7786-OUT,IMIN-7030-OUT,IMAX-6288-OUT,OMIN-4451-OUT,OMAX-7521-OUT;n:type:ShaderForge.SFN_If,id:3761,x:42654,y:31809,varname:node_3761,prsc:2|A-7786-OUT,B-7030-OUT,GT-2398-OUT,EQ-30-OUT,LT-30-OUT;n:type:ShaderForge.SFN_Vector1,id:4451,x:42782,y:31337,varname:node_4451,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:2101,x:42853,y:32800,varname:node_2101,prsc:2|A-7786-OUT,B-3399-OUT;n:type:ShaderForge.SFN_Multiply,id:3027,x:41667,y:32333,varname:node_3027,prsc:2|A-4036-OUT,B-9726-OUT;n:type:ShaderForge.SFN_Lerp,id:9347,x:43608,y:31390,varname:node_9347,prsc:2|A-3748-R,B-1058-RGB,T-5058-RGB;n:type:ShaderForge.SFN_Color,id:1954,x:43288,y:31387,ptovrint:False,ptlb:node_1954,ptin:_node_1954,varname:node_1954,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:5058,x:43299,y:31553,ptovrint:False,ptlb:node_5058,ptin:_node_5058,varname:node_5058,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:1058,x:43612,y:31184,ptovrint:False,ptlb:ColorGlobal2,ptin:_ColorGlobal2,varname:node_1058,prsc:2,glob:True,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;proporder:3748-3537-4036-3399-7786-7030-1954-5058;pass:END;sub:END;*/

Shader "Shader Forge/Ripple" {
    Properties {
        _TextureWave ("TextureWave", 2D) = "white" {}
        _DistanceWave ("DistanceWave", Float ) = 0.7
        _WaveWidth ("WaveWidth", Float ) = 0.2
        _SizeMax ("SizeMax", Float ) = 1
        _Progress ("Progress", Range(0, 1)) = 0
        _ValueMiddle ("ValueMiddle", Float ) = 0
        _node_1954 ("node_1954", Color) = (0.5,0.5,0.5,1)
        _node_5058 ("node_5058", Color) = (0.5,0.5,0.5,1)
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
            uniform sampler2D _TextureWave; uniform float4 _TextureWave_ST;
            uniform float _DistanceWave;
            uniform float _WaveWidth;
            uniform float _SizeMax;
            uniform float _Progress;
            uniform float _ValueMiddle;
            uniform float4 _node_5058;
            uniform float4 _ColorGlobal2;
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
                v.vertex.xyz += ((mul( _World2Object, float4(mul(_Object2World, v.vertex).rgb,0) ).xyz.rgb-objPos.rgb)*((_Progress*_SizeMax)-1.0));
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( _Object2World, float4(0,0,0,1) );
/////// Vectors:
////// Lighting:
////// Emissive:
                float4 _TextureWave_var = tex2D(_TextureWave,TRANSFORM_TEX(i.uv0, _TextureWave));
                float3 emissive = lerp(float3(_TextureWave_var.r,_TextureWave_var.r,_TextureWave_var.r),_ColorGlobal2.rgb,_node_5058.rgb);
                float3 finalColor = emissive;
                float node_3761_if_leA = step(_Progress,_ValueMiddle);
                float node_3761_if_leB = step(_ValueMiddle,_Progress);
                float node_7521 = 0.0;
                float node_4451 = 0.5;
                float node_30 = (node_7521 + ( (_Progress - node_7521) * (node_4451 - node_7521) ) / (_ValueMiddle - node_7521));
                float node_9726 = sin((lerp((node_3761_if_leA*node_30)+(node_3761_if_leB*(node_4451 + ( (_Progress - _ValueMiddle) * (node_7521 - node_4451) ) / (1.0 - _ValueMiddle))),node_30,node_3761_if_leA*node_3761_if_leB)*3.141592654));
                float node_4420 = abs(((distance(i.uv0,float2(0.5,0.5))*2.0)-_DistanceWave));
                float node_3027 = (_WaveWidth*node_9726);
                float node_7311_if_leA = step(node_4420,node_3027);
                float node_7311_if_leB = step(node_3027,node_4420);
                float node_6568 = 0.0;
                float node_200 = 1.0;
                float node_7382 = sin(((node_200 + ( (node_4420 - node_6568) * (node_6568 - node_200) ) / (node_3027 - node_6568))*0.5*3.141592654));
                return fixed4(finalColor,(node_9726*lerp((node_7311_if_leA*node_7382)+(node_7311_if_leB*0.0),node_7382,node_7311_if_leA*node_7311_if_leB)));
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
            uniform float _SizeMax;
            uniform float _Progress;
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
                v.vertex.xyz += ((mul( _World2Object, float4(mul(_Object2World, v.vertex).rgb,0) ).xyz.rgb-objPos.rgb)*((_Progress*_SizeMax)-1.0));
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
