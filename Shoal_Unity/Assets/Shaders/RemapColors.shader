// Shader created with Shader Forge v1.17 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.17;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:3138,x:33275,y:32801,varname:node_3138,prsc:2|emission-1622-RGB;n:type:ShaderForge.SFN_Tex2d,id:7325,x:32016,y:32707,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_7325,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:1622,x:32658,y:32556,ptovrint:False,ptlb:Ramp,ptin:_Ramp,varname:node_1622,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-7614-OUT;n:type:ShaderForge.SFN_Append,id:7614,x:32495,y:32636,varname:node_7614,prsc:2|A-9049-OUT,B-9887-OUT;n:type:ShaderForge.SFN_Vector1,id:9887,x:32458,y:32818,varname:node_9887,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Slider,id:5469,x:32283,y:32945,ptovrint:False,ptlb:MinValue,ptin:_MinValue,varname:node_5469,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:9049,x:32266,y:32738,varname:node_9049,prsc:2|IN-7325-R,IMIN-5469-OUT,IMAX-3888-OUT,OMIN-8040-OUT,OMAX-9022-OUT;n:type:ShaderForge.SFN_Slider,id:3888,x:31996,y:32958,ptovrint:False,ptlb:MaxValue,ptin:_MaxValue,varname:node_3888,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Vector1,id:8040,x:32622,y:32954,varname:node_8040,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:9022,x:32666,y:33077,varname:node_9022,prsc:2,v1:1;proporder:7325-1622-5469-3888;pass:END;sub:END;*/

Shader "Shader Forge/RemapColors" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _Ramp ("Ramp", 2D) = "white" {}
        _MinValue ("MinValue", Range(0, 1)) = 0
        _MaxValue ("MaxValue", Range(0, 1)) = 1
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _Ramp; uniform float4 _Ramp_ST;
            uniform float _MinValue;
            uniform float _MaxValue;
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
////// Lighting:
////// Emissive:
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float node_8040 = 0.0;
                float2 node_7614 = float2((node_8040 + ( (_MainTex_var.r - _MinValue) * (1.0 - node_8040) ) / (_MaxValue - _MinValue)),0.5);
                float4 _Ramp_var = tex2D(_Ramp,TRANSFORM_TEX(node_7614, _Ramp));
                float3 emissive = _Ramp_var.rgb;
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
