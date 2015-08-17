// Shader created with Shader Forge v1.17 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.17;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:3138,x:35639,y:31954,varname:node_3138,prsc:2|emission-1444-OUT,alpha-3297-OUT,clip-199-R;n:type:ShaderForge.SFN_Tex2d,id:199,x:34381,y:32386,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_513,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:81f53ba58c26041e3a594422eaada984,ntxv:0,isnm:False|UVIN-8574-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6066,x:34752,y:33279,ptovrint:False,ptlb:Posterize,ptin:_Posterize,varname:node_8670,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Posterize,id:5833,x:34591,y:33219,varname:node_5833,prsc:2|IN-1107-R,STPS-6066-OUT;n:type:ShaderForge.SFN_Tex2d,id:1107,x:34298,y:33172,ptovrint:False,ptlb:Perlin2,ptin:_Perlin2,varname:node_9570,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-936-OUT;n:type:ShaderForge.SFN_TexCoord,id:1359,x:32948,y:33276,varname:node_1359,prsc:2,uv:0;n:type:ShaderForge.SFN_Lerp,id:1444,x:34983,y:33030,varname:node_1444,prsc:2|A-7232-RGB,B-6076-RGB,T-5833-OUT;n:type:ShaderForge.SFN_Tex2d,id:7482,x:34372,y:33580,ptovrint:False,ptlb:DistoTexture,ptin:_DistoTexture,varname:node_2438,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1fd9cfb6ee7f28246a84334e97732894,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Cos,id:9161,x:34709,y:33639,varname:node_9161,prsc:2|IN-5104-OUT;n:type:ShaderForge.SFN_Sin,id:2548,x:34709,y:33789,varname:node_2548,prsc:2|IN-5104-OUT;n:type:ShaderForge.SFN_Tau,id:3589,x:34389,y:33767,varname:node_3589,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5104,x:34528,y:33728,varname:node_5104,prsc:2|A-7482-R,B-3589-OUT;n:type:ShaderForge.SFN_Append,id:9776,x:34960,y:33686,varname:node_9776,prsc:2|A-9161-OUT,B-2548-OUT;n:type:ShaderForge.SFN_Multiply,id:5622,x:35292,y:33739,varname:node_5622,prsc:2|A-9776-OUT,B-9605-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9605,x:35153,y:33773,ptovrint:False,ptlb:ForceDistoTexture,ptin:_ForceDistoTexture,varname:node_459,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.1;n:type:ShaderForge.SFN_Add,id:936,x:33917,y:33311,varname:node_936,prsc:2|A-1359-UVOUT,B-5622-OUT,C-6891-OUT;n:type:ShaderForge.SFN_Multiply,id:5629,x:33706,y:32710,varname:node_5629,prsc:2|A-482-OUT,B-5809-OUT,C-1012-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5809,x:33318,y:32909,ptovrint:False,ptlb:ForceDistoShape,ptin:_ForceDistoShape,varname:node_1013,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Add,id:8574,x:34018,y:32545,varname:node_8574,prsc:2|A-1359-UVOUT,B-5629-OUT;n:type:ShaderForge.SFN_Tex2d,id:4402,x:32536,y:32532,ptovrint:False,ptlb:DistoShape,ptin:_DistoShape,varname:node_896,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e3a20a274afd821478fc78aa61ff2495,ntxv:0,isnm:False|UVIN-6852-UVOUT;n:type:ShaderForge.SFN_Cos,id:2057,x:33184,y:32558,varname:node_2057,prsc:2|IN-9511-OUT;n:type:ShaderForge.SFN_Sin,id:5350,x:33184,y:32708,varname:node_5350,prsc:2|IN-9511-OUT;n:type:ShaderForge.SFN_Tau,id:437,x:32864,y:32686,varname:node_437,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9511,x:33003,y:32647,varname:node_9511,prsc:2|A-4402-R,B-437-OUT;n:type:ShaderForge.SFN_Append,id:482,x:33435,y:32605,varname:node_482,prsc:2|A-2057-OUT,B-5350-OUT;n:type:ShaderForge.SFN_Time,id:2031,x:32976,y:33856,varname:node_2031,prsc:2;n:type:ShaderForge.SFN_Vector1,id:6394,x:33524,y:33791,varname:node_6394,prsc:2,v1:0;n:type:ShaderForge.SFN_Append,id:6891,x:33859,y:33884,varname:node_6891,prsc:2|A-6394-OUT,B-1854-OUT;n:type:ShaderForge.SFN_Multiply,id:1854,x:33463,y:33908,varname:node_1854,prsc:2|A-2031-T,B-3679-OUT;n:type:ShaderForge.SFN_Vector1,id:3679,x:33123,y:34094,varname:node_3679,prsc:2,v1:0.2;n:type:ShaderForge.SFN_TexCoord,id:7643,x:31525,y:32617,varname:node_7643,prsc:2,uv:0;n:type:ShaderForge.SFN_Vector2,id:4223,x:32869,y:33526,varname:node_4223,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Distance,id:8793,x:33084,y:33478,varname:node_8793,prsc:2|A-1359-UVOUT,B-4223-OUT;n:type:ShaderForge.SFN_Multiply,id:9624,x:33248,y:33494,varname:node_9624,prsc:2|A-8793-OUT,B-148-OUT;n:type:ShaderForge.SFN_Vector1,id:148,x:33134,y:33718,varname:node_148,prsc:2,v1:2;n:type:ShaderForge.SFN_OneMinus,id:1012,x:33470,y:33391,varname:node_1012,prsc:2|IN-9624-OUT;n:type:ShaderForge.SFN_Time,id:985,x:31624,y:32989,varname:node_985,prsc:2;n:type:ShaderForge.SFN_Add,id:2249,x:31756,y:32781,varname:node_2249,prsc:2|A-7643-U,B-985-TSL,C-7140-OUT;n:type:ShaderForge.SFN_Append,id:971,x:31920,y:32582,varname:node_971,prsc:2|A-2249-OUT,B-7643-V;n:type:ShaderForge.SFN_ValueProperty,id:7140,x:32071,y:33038,ptovrint:False,ptlb:rand,ptin:_rand,varname:node_7140,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:2822,x:32515,y:32955,varname:node_2822,prsc:2|A-7140-OUT,B-1082-OUT;n:type:ShaderForge.SFN_Tau,id:1082,x:32445,y:33063,varname:node_1082,prsc:2;n:type:ShaderForge.SFN_Rotator,id:6852,x:32255,y:32641,varname:node_6852,prsc:2|UVIN-971-OUT,ANG-2822-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3297,x:35544,y:32631,ptovrint:False,ptlb:MyOpacity,ptin:_MyOpacity,varname:node_3297,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.4;n:type:ShaderForge.SFN_Color,id:6076,x:34312,y:32803,ptovrint:False,ptlb:_ColorGlobal,ptin:_ColorGlobal,varname:node_6076,prsc:2,glob:True,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:7232,x:34388,y:32990,ptovrint:False,ptlb:_ColorGlobal2,ptin:_ColorGlobal2,varname:__ColorGlobal_copy,prsc:2,glob:True,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;proporder:199-6066-1107-5809-4402-7482-9605-7140-3297;pass:END;sub:END;*/

Shader "Shader Forge/BodyMonster" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _Posterize ("Posterize", Float ) = 0
        _Perlin2 ("Perlin2", 2D) = "white" {}
        _ForceDistoShape ("ForceDistoShape", Float ) = 1
        _DistoShape ("DistoShape", 2D) = "white" {}
        _DistoTexture ("DistoTexture", 2D) = "white" {}
        _ForceDistoTexture ("ForceDistoTexture", Float ) = 0.1
        _rand ("rand", Float ) = 0
        _MyOpacity ("MyOpacity", Float ) = 0.4
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
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _Posterize;
            uniform sampler2D _Perlin2; uniform float4 _Perlin2_ST;
            uniform sampler2D _DistoTexture; uniform float4 _DistoTexture_ST;
            uniform float _ForceDistoTexture;
            uniform float _ForceDistoShape;
            uniform sampler2D _DistoShape; uniform float4 _DistoShape_ST;
            uniform float _rand;
            uniform float _MyOpacity;
            uniform float4 _ColorGlobal;
            uniform float4 _ColorGlobal2;
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
                float node_6852_ang = (_rand*6.28318530718);
                float node_6852_spd = 1.0;
                float node_6852_cos = cos(node_6852_spd*node_6852_ang);
                float node_6852_sin = sin(node_6852_spd*node_6852_ang);
                float2 node_6852_piv = float2(0.5,0.5);
                float4 node_985 = _Time + _TimeEditor;
                float2 node_6852 = (mul(float2((i.uv0.r+node_985.r+_rand),i.uv0.g)-node_6852_piv,float2x2( node_6852_cos, -node_6852_sin, node_6852_sin, node_6852_cos))+node_6852_piv);
                float4 _DistoShape_var = tex2D(_DistoShape,TRANSFORM_TEX(node_6852, _DistoShape));
                float node_9511 = (_DistoShape_var.r*6.28318530718);
                float2 node_8574 = (i.uv0+(float2(cos(node_9511),sin(node_9511))*_ForceDistoShape*(1.0 - (distance(i.uv0,float2(0.5,0.5))*2.0))));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_8574, _MainTex));
                clip(_MainTex_var.r - 0.5);
////// Lighting:
////// Emissive:
                float4 _DistoTexture_var = tex2D(_DistoTexture,TRANSFORM_TEX(i.uv0, _DistoTexture));
                float node_5104 = (_DistoTexture_var.r*6.28318530718);
                float4 node_2031 = _Time + _TimeEditor;
                float2 node_936 = (i.uv0+(float2(cos(node_5104),sin(node_5104))*_ForceDistoTexture)+float2(0.0,(node_2031.g*0.2)));
                float4 _Perlin2_var = tex2D(_Perlin2,TRANSFORM_TEX(node_936, _Perlin2));
                float3 emissive = lerp(_ColorGlobal2.rgb,_ColorGlobal.rgb,floor(_Perlin2_var.r * _Posterize) / (_Posterize - 1));
                float3 finalColor = emissive;
                return fixed4(finalColor,_MyOpacity);
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
            uniform float _ForceDistoShape;
            uniform sampler2D _DistoShape; uniform float4 _DistoShape_ST;
            uniform float _rand;
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
                float node_6852_ang = (_rand*6.28318530718);
                float node_6852_spd = 1.0;
                float node_6852_cos = cos(node_6852_spd*node_6852_ang);
                float node_6852_sin = sin(node_6852_spd*node_6852_ang);
                float2 node_6852_piv = float2(0.5,0.5);
                float4 node_985 = _Time + _TimeEditor;
                float2 node_6852 = (mul(float2((i.uv0.r+node_985.r+_rand),i.uv0.g)-node_6852_piv,float2x2( node_6852_cos, -node_6852_sin, node_6852_sin, node_6852_cos))+node_6852_piv);
                float4 _DistoShape_var = tex2D(_DistoShape,TRANSFORM_TEX(node_6852, _DistoShape));
                float node_9511 = (_DistoShape_var.r*6.28318530718);
                float2 node_8574 = (i.uv0+(float2(cos(node_9511),sin(node_9511))*_ForceDistoShape*(1.0 - (distance(i.uv0,float2(0.5,0.5))*2.0))));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_8574, _MainTex));
                clip(_MainTex_var.r - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
