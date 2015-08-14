// Shader created with Shader Forge v1.17 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.17;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:3138,x:35934,y:32600,varname:node_3138,prsc:2|emission-1629-OUT,alpha-1406-OUT,clip-513-A;n:type:ShaderForge.SFN_Color,id:7241,x:34574,y:32800,ptovrint:False,ptlb:ColorA,ptin:_ColorA,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Tex2d,id:513,x:34093,y:32730,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_513,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:81f53ba58c26041e3a594422eaada984,ntxv:0,isnm:False|UVIN-5058-OUT;n:type:ShaderForge.SFN_ValueProperty,id:8670,x:34688,y:33215,ptovrint:False,ptlb:Posterize,ptin:_Posterize,varname:node_8670,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Posterize,id:1057,x:34527,y:33155,varname:node_1057,prsc:2|IN-9570-R,STPS-8670-OUT;n:type:ShaderForge.SFN_Tex2d,id:9570,x:34136,y:33116,ptovrint:False,ptlb:Perlin2,ptin:_Perlin2,varname:node_9570,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-8308-OUT;n:type:ShaderForge.SFN_TexCoord,id:8217,x:32286,y:33122,varname:node_8217,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:377,x:32585,y:33270,varname:node_377,prsc:2|A-8217-V,B-4039-OUT,C-3804-OUT;n:type:ShaderForge.SFN_Tau,id:4039,x:32384,y:33279,varname:node_4039,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:3804,x:32335,y:33466,ptovrint:False,ptlb:freq,ptin:_freq,varname:node_3804,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:3;n:type:ShaderForge.SFN_Cos,id:1299,x:32894,y:33248,varname:node_1299,prsc:2|IN-5287-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2631,x:33010,y:33347,ptovrint:False,ptlb:MaxDistort,ptin:_MaxDistort,varname:node_2631,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.2;n:type:ShaderForge.SFN_Multiply,id:4388,x:33194,y:33313,varname:node_4388,prsc:2|A-1299-OUT,B-2631-OUT,C-4694-OUT;n:type:ShaderForge.SFN_OneMinus,id:4694,x:32995,y:33461,varname:node_4694,prsc:2|IN-8217-V;n:type:ShaderForge.SFN_Add,id:8030,x:33376,y:33230,varname:node_8030,prsc:2|A-8217-U,B-4388-OUT;n:type:ShaderForge.SFN_Append,id:6686,x:33592,y:33177,varname:node_6686,prsc:2|A-8030-OUT,B-8217-V;n:type:ShaderForge.SFN_Add,id:5287,x:32750,y:33302,varname:node_5287,prsc:2|A-377-OUT,B-8583-TDB;n:type:ShaderForge.SFN_Time,id:8583,x:32555,y:33493,varname:node_8583,prsc:2;n:type:ShaderForge.SFN_Color,id:8443,x:34557,y:32984,ptovrint:False,ptlb:ColorB,ptin:_ColorB,varname:node_8443,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Lerp,id:1629,x:34919,y:32966,varname:node_1629,prsc:2|A-7241-RGB,B-8443-RGB,T-1057-OUT;n:type:ShaderForge.SFN_Tex2d,id:2438,x:34096,y:33678,ptovrint:False,ptlb:DistoTexture,ptin:_DistoTexture,varname:node_2438,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1fd9cfb6ee7f28246a84334e97732894,ntxv:0,isnm:False|UVIN-6538-OUT;n:type:ShaderForge.SFN_Cos,id:747,x:34645,y:33575,varname:node_747,prsc:2|IN-938-OUT;n:type:ShaderForge.SFN_Sin,id:5827,x:34645,y:33725,varname:node_5827,prsc:2|IN-938-OUT;n:type:ShaderForge.SFN_Tau,id:3927,x:34325,y:33703,varname:node_3927,prsc:2;n:type:ShaderForge.SFN_Multiply,id:938,x:34464,y:33664,varname:node_938,prsc:2|A-2438-R,B-3927-OUT;n:type:ShaderForge.SFN_Append,id:40,x:34896,y:33622,varname:node_40,prsc:2|A-747-OUT,B-5827-OUT;n:type:ShaderForge.SFN_Multiply,id:9803,x:35228,y:33675,varname:node_9803,prsc:2|A-40-OUT,B-459-OUT;n:type:ShaderForge.SFN_ValueProperty,id:459,x:35089,y:33709,ptovrint:False,ptlb:ForceDistoTexture,ptin:_ForceDistoTexture,varname:node_459,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.1;n:type:ShaderForge.SFN_Add,id:8308,x:33831,y:33293,varname:node_8308,prsc:2|A-6686-OUT,B-9803-OUT,C-877-OUT;n:type:ShaderForge.SFN_Multiply,id:3378,x:33488,y:32772,varname:node_3378,prsc:2|A-3695-OUT,B-1013-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1013,x:33254,y:32845,ptovrint:False,ptlb:ForceDistoShape,ptin:_ForceDistoShape,varname:node_1013,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Add,id:5058,x:33880,y:32788,varname:node_5058,prsc:2|A-6686-OUT,B-3378-OUT;n:type:ShaderForge.SFN_Tex2d,id:896,x:32520,y:32504,ptovrint:False,ptlb:DistoShape,ptin:_DistoShape,varname:node_896,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Cos,id:6332,x:33120,y:32494,varname:node_6332,prsc:2|IN-1152-OUT;n:type:ShaderForge.SFN_Sin,id:8901,x:33120,y:32644,varname:node_8901,prsc:2|IN-1152-OUT;n:type:ShaderForge.SFN_Tau,id:3699,x:32800,y:32622,varname:node_3699,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1152,x:32939,y:32583,varname:node_1152,prsc:2|A-896-R,B-3699-OUT;n:type:ShaderForge.SFN_Append,id:3695,x:33371,y:32541,varname:node_3695,prsc:2|A-6332-OUT,B-8901-OUT;n:type:ShaderForge.SFN_Vector1,id:1406,x:35535,y:33023,varname:node_1406,prsc:2,v1:0.8;n:type:ShaderForge.SFN_Time,id:3274,x:33367,y:33870,varname:node_3274,prsc:2;n:type:ShaderForge.SFN_Vector1,id:4263,x:33616,y:33666,varname:node_4263,prsc:2,v1:0;n:type:ShaderForge.SFN_Append,id:877,x:33744,y:33815,varname:node_877,prsc:2|A-4263-OUT,B-6417-OUT;n:type:ShaderForge.SFN_Multiply,id:6417,x:33603,y:33932,varname:node_6417,prsc:2|A-3274-T,B-1894-OUT;n:type:ShaderForge.SFN_Vector1,id:1894,x:33442,y:34031,varname:node_1894,prsc:2,v1:0.2;n:type:ShaderForge.SFN_TexCoord,id:6082,x:33868,y:33969,varname:node_6082,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:6538,x:34075,y:33903,varname:node_6538,prsc:2|A-6082-UVOUT,B-877-OUT;proporder:7241-513-8670-3804-2631-8443-9570-2438-459-1013-896;pass:END;sub:END;*/

Shader "Shader Forge/EnemyWingsShader" {
    Properties {
        _ColorA ("ColorA", Color) = (0,0,0,1)
        _MainTex ("MainTex", 2D) = "white" {}
        _Posterize ("Posterize", Float ) = 0
        _freq ("freq", Float ) = 3
        _MaxDistort ("MaxDistort", Float ) = 0.2
        _ColorB ("ColorB", Color) = (0.5,0.5,0.5,1)
        _Perlin2 ("Perlin2", 2D) = "white" {}
        _DistoTexture ("DistoTexture", 2D) = "white" {}
        _ForceDistoTexture ("ForceDistoTexture", Float ) = 0.1
        _ForceDistoShape ("ForceDistoShape", Float ) = 0
        _DistoShape ("DistoShape", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
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
            uniform float4 _TimeEditor;
            uniform float4 _ColorA;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _Posterize;
            uniform sampler2D _Perlin2; uniform float4 _Perlin2_ST;
            uniform float _freq;
            uniform float _MaxDistort;
            uniform float4 _ColorB;
            uniform sampler2D _DistoTexture; uniform float4 _DistoTexture_ST;
            uniform float _ForceDistoTexture;
            uniform float _ForceDistoShape;
            uniform sampler2D _DistoShape; uniform float4 _DistoShape_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
/////// Vectors:
                float4 node_8583 = _Time + _TimeEditor;
                float2 node_6686 = float2((i.uv0.r+(cos(((i.uv0.g*6.28318530718*_freq)+node_8583.b))*_MaxDistort*(1.0 - i.uv0.g))),i.uv0.g);
                float4 _DistoShape_var = tex2D(_DistoShape,TRANSFORM_TEX(i.uv0, _DistoShape));
                float node_1152 = (_DistoShape_var.r*6.28318530718);
                float2 node_5058 = (node_6686+(float2(cos(node_1152),sin(node_1152))*_ForceDistoShape));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_5058, _MainTex));
                clip(_MainTex_var.a - 0.5);
////// Lighting:
////// Emissive:
                float node_4263 = 0.0;
                float4 node_3274 = _Time + _TimeEditor;
                float2 node_877 = float2(node_4263,(node_3274.g*0.2));
                float2 node_6538 = (i.uv0+node_877);
                float4 _DistoTexture_var = tex2D(_DistoTexture,TRANSFORM_TEX(node_6538, _DistoTexture));
                float node_938 = (_DistoTexture_var.r*6.28318530718);
                float node_747 = cos(node_938);
                float node_5827 = sin(node_938);
                float2 node_8308 = (node_6686+(float2(node_747,node_5827)*_ForceDistoTexture)+node_877);
                float4 _Perlin2_var = tex2D(_Perlin2,TRANSFORM_TEX(node_8308, _Perlin2));
                float3 emissive = lerp(_ColorA.rgb,_ColorB.rgb,floor(_Perlin2_var.r * _Posterize) / (_Posterize - 1));
                float3 finalColor = emissive;
                return fixed4(finalColor,0.8);
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
            uniform float4 _TimeEditor;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _freq;
            uniform float _MaxDistort;
            uniform float _ForceDistoShape;
            uniform sampler2D _DistoShape; uniform float4 _DistoShape_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
/////// Vectors:
                float4 node_8583 = _Time + _TimeEditor;
                float2 node_6686 = float2((i.uv0.r+(cos(((i.uv0.g*6.28318530718*_freq)+node_8583.b))*_MaxDistort*(1.0 - i.uv0.g))),i.uv0.g);
                float4 _DistoShape_var = tex2D(_DistoShape,TRANSFORM_TEX(i.uv0, _DistoShape));
                float node_1152 = (_DistoShape_var.r*6.28318530718);
                float2 node_5058 = (node_6686+(float2(cos(node_1152),sin(node_1152))*_ForceDistoShape));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_5058, _MainTex));
                clip(_MainTex_var.a - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
