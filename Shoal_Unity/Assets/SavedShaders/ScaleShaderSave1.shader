// Shader created with Shader Forge v1.17 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.17;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:3138,x:34039,y:32546,varname:node_3138,prsc:2|emission-5993-OUT,clip-7571-OUT,voffset-2958-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32044,y:32456,ptovrint:False,ptlb:MainColorA,ptin:_MainColorA,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.07843138,c2:0.3921569,c3:0.7843137,c4:1;n:type:ShaderForge.SFN_Color,id:3906,x:32005,y:32886,ptovrint:False,ptlb:OutlineColorA,ptin:_OutlineColorA,varname:node_3906,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_TexCoord,id:1083,x:32445,y:33016,varname:node_1083,prsc:2,uv:0;n:type:ShaderForge.SFN_Distance,id:4382,x:32605,y:32986,varname:node_4382,prsc:2|A-1083-UVOUT,B-3215-OUT;n:type:ShaderForge.SFN_Vector2,id:3215,x:32605,y:33105,varname:node_3215,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Multiply,id:7041,x:32756,y:32986,varname:node_7041,prsc:2|A-4382-OUT,B-7612-OUT;n:type:ShaderForge.SFN_Vector1,id:7612,x:32756,y:33105,varname:node_7612,prsc:2,v1:2;n:type:ShaderForge.SFN_If,id:7571,x:33030,y:32987,varname:node_7571,prsc:2|A-7041-OUT,B-7417-OUT,GT-6027-OUT,EQ-6027-OUT,LT-7417-OUT;n:type:ShaderForge.SFN_Vector1,id:7417,x:32920,y:33118,varname:node_7417,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:6027,x:33063,y:33123,varname:node_6027,prsc:2,v1:0;n:type:ShaderForge.SFN_If,id:5993,x:33081,y:32812,varname:node_5993,prsc:2|A-7041-OUT,B-5694-OUT,GT-2835-OUT,EQ-658-OUT,LT-658-OUT;n:type:ShaderForge.SFN_Slider,id:487,x:32462,y:32653,ptovrint:False,ptlb:OutlineWidth,ptin:_OutlineWidth,varname:node_487,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1282051,max:1;n:type:ShaderForge.SFN_OneMinus,id:5694,x:32826,y:32782,varname:node_5694,prsc:2|IN-9289-OUT;n:type:ShaderForge.SFN_Color,id:7027,x:32005,y:33053,ptovrint:False,ptlb:OutlineColorB,ptin:_OutlineColorB,varname:node_7027,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Slider,id:7556,x:32210,y:32955,ptovrint:False,ptlb:LerpOutlineColor,ptin:_LerpOutlineColor,varname:node_7556,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Lerp,id:2835,x:32240,y:32770,varname:node_2835,prsc:2|A-3906-RGB,B-7027-RGB,T-7556-OUT;n:type:ShaderForge.SFN_Slider,id:6062,x:32308,y:32431,ptovrint:False,ptlb:LerpMainColor,ptin:_LerpMainColor,varname:node_6062,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Color,id:2893,x:32044,y:32620,ptovrint:False,ptlb:MainColorB,ptin:_MainColorB,varname:node_2893,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Lerp,id:658,x:32240,y:32515,varname:node_658,prsc:2|A-7241-RGB,B-2893-RGB,T-6062-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4336,x:32798,y:32539,ptovrint:False,ptlb:_GlobalOutlineWidth,ptin:_GlobalOutlineWidth,varname:node_4336,prsc:2,glob:True,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_SwitchProperty,id:9289,x:32991,y:32589,ptovrint:False,ptlb:UseGlobalOutlineWidth,ptin:_UseGlobalOutlineWidth,varname:node_9289,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-487-OUT,B-4336-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:3242,x:33285,y:33023,varname:node_3242,prsc:2;n:type:ShaderForge.SFN_Subtract,id:8237,x:33744,y:33056,varname:node_8237,prsc:2|A-6964-XYZ,B-6069-XYZ;n:type:ShaderForge.SFN_ObjectPosition,id:6069,x:33431,y:33317,varname:node_6069,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:1763,x:33663,y:33330,ptovrint:False,ptlb:Size,ptin:_Size,varname:node_1763,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:8610,x:34024,y:33202,varname:node_8610,prsc:2|A-8237-OUT,B-5050-OUT;n:type:ShaderForge.SFN_Transform,id:6964,x:33465,y:33007,varname:node_6964,prsc:2,tffrom:0,tfto:1|IN-3242-XYZ;n:type:ShaderForge.SFN_Subtract,id:5050,x:33832,y:33311,varname:node_5050,prsc:2|A-1763-OUT,B-8888-OUT;n:type:ShaderForge.SFN_Vector1,id:8888,x:33593,y:33400,varname:node_8888,prsc:2,v1:1;n:type:ShaderForge.SFN_Add,id:2958,x:34279,y:33073,varname:node_2958,prsc:2|A-8610-OUT,B-5997-OUT;n:type:ShaderForge.SFN_Vector3,id:5997,x:34338,y:33243,varname:node_5997,prsc:2,v1:0,v2:0,v3:-0.1;proporder:7241-3906-487-7027-7556-6062-2893-9289-1763;pass:END;sub:END;*/

Shader "Shader Forge/ScaleShader" {
    Properties {
        _MainColorA ("MainColorA", Color) = (0.07843138,0.3921569,0.7843137,1)
        _OutlineColorA ("OutlineColorA", Color) = (0.5,0.5,0.5,1)
        _OutlineWidth ("OutlineWidth", Range(0, 1)) = 0.1282051
        _OutlineColorB ("OutlineColorB", Color) = (0.5,0.5,0.5,1)
        _LerpOutlineColor ("LerpOutlineColor", Range(0, 1)) = 0
        _LerpMainColor ("LerpMainColor", Range(0, 1)) = 0
        _MainColorB ("MainColorB", Color) = (0.5,0.5,0.5,1)
        [MaterialToggle] _UseGlobalOutlineWidth ("UseGlobalOutlineWidth", Float ) = 1
        _Size ("Size", Float ) = 1
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
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
            uniform float4 _MainColorA;
            uniform float4 _OutlineColorA;
            uniform float _OutlineWidth;
            uniform float4 _OutlineColorB;
            uniform float _LerpOutlineColor;
            uniform float _LerpMainColor;
            uniform float4 _MainColorB;
            uniform float _GlobalOutlineWidth;
            uniform fixed _UseGlobalOutlineWidth;
            uniform float _Size;
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
                v.vertex.xyz += (((mul( _World2Object, float4(mul(_Object2World, v.vertex).rgb,0) ).xyz.rgb-objPos.rgb)*(_Size-1.0))+float3(0,0,-0.1));
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( _Object2World, float4(0,0,0,1) );
/////// Vectors:
                float node_7041 = (distance(i.uv0,float2(0.5,0.5))*2.0);
                float node_7417 = 1.0;
                float node_7571_if_leA = step(node_7041,node_7417);
                float node_7571_if_leB = step(node_7417,node_7041);
                float node_6027 = 0.0;
                clip(lerp((node_7571_if_leA*node_7417)+(node_7571_if_leB*node_6027),node_6027,node_7571_if_leA*node_7571_if_leB) - 0.5);
////// Lighting:
////// Emissive:
                float node_5993_if_leA = step(node_7041,(1.0 - lerp( _OutlineWidth, _GlobalOutlineWidth, _UseGlobalOutlineWidth )));
                float node_5993_if_leB = step((1.0 - lerp( _OutlineWidth, _GlobalOutlineWidth, _UseGlobalOutlineWidth )),node_7041);
                float3 node_658 = lerp(_MainColorA.rgb,_MainColorB.rgb,_LerpMainColor);
                float3 emissive = lerp((node_5993_if_leA*node_658)+(node_5993_if_leB*lerp(_OutlineColorA.rgb,_OutlineColorB.rgb,_LerpOutlineColor)),node_658,node_5993_if_leA*node_5993_if_leB);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
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
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float4 objPos = mul ( _Object2World, float4(0,0,0,1) );
                v.vertex.xyz += (((mul( _World2Object, float4(mul(_Object2World, v.vertex).rgb,0) ).xyz.rgb-objPos.rgb)*(_Size-1.0))+float3(0,0,-0.1));
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( _Object2World, float4(0,0,0,1) );
/////// Vectors:
                float node_7041 = (distance(i.uv0,float2(0.5,0.5))*2.0);
                float node_7417 = 1.0;
                float node_7571_if_leA = step(node_7041,node_7417);
                float node_7571_if_leB = step(node_7417,node_7041);
                float node_6027 = 0.0;
                clip(lerp((node_7571_if_leA*node_7417)+(node_7571_if_leB*node_6027),node_6027,node_7571_if_leA*node_7571_if_leB) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
