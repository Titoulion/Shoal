// Shader created with Shader Forge v1.17 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.17;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:3138,x:34917,y:32104,varname:node_3138,prsc:2|emission-5420-OUT,clip-7571-OUT,voffset-2958-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:31460,y:32305,ptovrint:False,ptlb:MainColor1A,ptin:_MainColor1A,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.07843138,c2:0.3921569,c3:0.7843137,c4:1;n:type:ShaderForge.SFN_Color,id:3906,x:31732,y:32870,ptovrint:False,ptlb:MainColor2A,ptin:_MainColor2A,varname:node_3906,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_TexCoord,id:1083,x:32375,y:33386,varname:node_1083,prsc:2,uv:0;n:type:ShaderForge.SFN_Distance,id:4382,x:32576,y:33375,varname:node_4382,prsc:2|A-1083-UVOUT,B-3215-OUT;n:type:ShaderForge.SFN_Vector2,id:3215,x:32612,y:33601,varname:node_3215,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Multiply,id:7041,x:32775,y:33357,varname:node_7041,prsc:2|A-4382-OUT,B-7612-OUT;n:type:ShaderForge.SFN_Vector1,id:7612,x:32775,y:33465,varname:node_7612,prsc:2,v1:2;n:type:ShaderForge.SFN_If,id:7571,x:33892,y:32651,varname:node_7571,prsc:2|A-7041-OUT,B-7417-OUT,GT-6027-OUT,EQ-6027-OUT,LT-7417-OUT;n:type:ShaderForge.SFN_Vector1,id:7417,x:33892,y:32838,varname:node_7417,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:6027,x:33892,y:32787,varname:node_6027,prsc:2,v1:0;n:type:ShaderForge.SFN_If,id:5993,x:33833,y:31830,varname:node_5993,prsc:2|A-7041-OUT,B-5694-OUT,GT-950-OUT,EQ-9284-OUT,LT-9284-OUT;n:type:ShaderForge.SFN_Slider,id:487,x:32400,y:31889,ptovrint:False,ptlb:OutlineWidth,ptin:_OutlineWidth,varname:node_487,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1282051,max:1;n:type:ShaderForge.SFN_OneMinus,id:5694,x:32916,y:31906,varname:node_5694,prsc:2|IN-9289-OUT;n:type:ShaderForge.SFN_Color,id:7027,x:31696,y:33037,ptovrint:False,ptlb:MainColor2B,ptin:_MainColor2B,varname:node_7027,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Slider,id:7556,x:31852,y:33182,ptovrint:False,ptlb:LerpColor2,ptin:_LerpColor2,varname:node_7556,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Lerp,id:2835,x:32106,y:32861,varname:node_2835,prsc:2|A-3906-RGB,B-7027-RGB,T-7556-OUT;n:type:ShaderForge.SFN_Slider,id:6062,x:31438,y:32679,ptovrint:False,ptlb:LerpColor1,ptin:_LerpColor1,varname:node_6062,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Color,id:2893,x:31460,y:32478,ptovrint:False,ptlb:MainColor1B,ptin:_MainColor1B,varname:node_2893,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Lerp,id:658,x:32087,y:32531,varname:node_658,prsc:2|A-7241-RGB,B-2893-RGB,T-6062-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4336,x:32529,y:31990,ptovrint:False,ptlb:_GlobalOutlineWidth,ptin:_GlobalOutlineWidth,varname:node_4336,prsc:2,glob:True,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_SwitchProperty,id:9289,x:32730,y:31916,ptovrint:False,ptlb:UseGlobalOutlineWidth,ptin:_UseGlobalOutlineWidth,varname:node_9289,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-487-OUT,B-4336-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:3242,x:33493,y:33009,varname:node_3242,prsc:2;n:type:ShaderForge.SFN_Subtract,id:8237,x:33844,y:33009,varname:node_8237,prsc:2|A-6964-XYZ,B-6069-XYZ;n:type:ShaderForge.SFN_ObjectPosition,id:6069,x:33844,y:33139,varname:node_6069,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:1763,x:34028,y:32951,ptovrint:False,ptlb:Size,ptin:_Size,varname:node_1763,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:8610,x:34026,y:33009,varname:node_8610,prsc:2|A-8237-OUT,B-5050-OUT;n:type:ShaderForge.SFN_Transform,id:6964,x:33671,y:33009,varname:node_6964,prsc:2,tffrom:0,tfto:1|IN-3242-XYZ;n:type:ShaderForge.SFN_Subtract,id:5050,x:34026,y:33129,varname:node_5050,prsc:2|A-1763-OUT,B-8888-OUT;n:type:ShaderForge.SFN_Vector1,id:8888,x:34026,y:33275,varname:node_8888,prsc:2,v1:1;n:type:ShaderForge.SFN_Add,id:2958,x:34211,y:33009,varname:node_2958,prsc:2|A-8610-OUT,B-5997-OUT;n:type:ShaderForge.SFN_Vector3,id:5997,x:34211,y:33129,varname:node_5997,prsc:2,v1:0,v2:0,v3:-0.1;n:type:ShaderForge.SFN_Relay,id:950,x:32700,y:32717,varname:node_950,prsc:2|IN-7873-OUT;n:type:ShaderForge.SFN_Tex2d,id:6695,x:33504,y:32468,ptovrint:False,ptlb:Perlin,ptin:_Perlin,varname:node_6695,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-8329-UVOUT;n:type:ShaderForge.SFN_Add,id:6581,x:33716,y:32335,varname:node_6581,prsc:2|A-466-OUT,B-6695-R;n:type:ShaderForge.SFN_Clamp01,id:1339,x:33879,y:32368,varname:node_1339,prsc:2|IN-6581-OUT;n:type:ShaderForge.SFN_Posterize,id:7653,x:34190,y:32377,varname:node_7653,prsc:2|IN-1339-OUT,STPS-206-OUT;n:type:ShaderForge.SFN_ValueProperty,id:206,x:34029,y:32465,ptovrint:False,ptlb:PosterizeValue,ptin:_PosterizeValue,varname:node_206,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Lerp,id:6920,x:34404,y:32287,varname:node_6920,prsc:2|A-9284-OUT,B-950-OUT,T-7653-OUT;n:type:ShaderForge.SFN_RemapRange,id:466,x:33846,y:32133,varname:node_466,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-5694-OUT;n:type:ShaderForge.SFN_Rotator,id:8329,x:33194,y:32509,varname:node_8329,prsc:2|UVIN-3763-UVOUT,ANG-9778-OUT;n:type:ShaderForge.SFN_TexCoord,id:3763,x:32868,y:32504,varname:node_3763,prsc:2,uv:0;n:type:ShaderForge.SFN_ValueProperty,id:9778,x:33073,y:32646,ptovrint:False,ptlb:RotationPerlin,ptin:_RotationPerlin,varname:node_9778,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_SwitchProperty,id:5420,x:34530,y:32013,ptovrint:False,ptlb:UsePerlin,ptin:_UsePerlin,varname:node_5420,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-5993-OUT,B-6920-OUT;n:type:ShaderForge.SFN_Slider,id:6848,x:32148,y:32299,ptovrint:False,ptlb:TransitionValue,ptin:_TransitionValue,varname:node_6848,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Relay,id:9284,x:32835,y:32201,varname:node_9284,prsc:2|IN-8609-OUT;n:type:ShaderForge.SFN_Lerp,id:8609,x:32466,y:32506,varname:node_8609,prsc:2|A-658-OUT,B-2835-OUT,T-6848-OUT;n:type:ShaderForge.SFN_Lerp,id:7873,x:32458,y:32767,varname:node_7873,prsc:2|A-2835-OUT,B-658-OUT,T-6848-OUT;proporder:7241-3906-487-7027-7556-6062-2893-9289-1763-6695-206-9778-5420-6848;pass:END;sub:END;*/

Shader "Shader Forge/ScaleShader" {
    Properties {
        _MainColor1A ("MainColor1A", Color) = (0.07843138,0.3921569,0.7843137,1)
        _MainColor2A ("MainColor2A", Color) = (0.5,0.5,0.5,1)
        _OutlineWidth ("OutlineWidth", Range(0, 1)) = 0.1282051
        _MainColor2B ("MainColor2B", Color) = (0.5,0.5,0.5,1)
        _LerpColor2 ("LerpColor2", Range(0, 1)) = 0
        _LerpColor1 ("LerpColor1", Range(0, 1)) = 0
        _MainColor1B ("MainColor1B", Color) = (0.5,0.5,0.5,1)
        [MaterialToggle] _UseGlobalOutlineWidth ("UseGlobalOutlineWidth", Float ) = 1
        _Size ("Size", Float ) = 1
        _Perlin ("Perlin", 2D) = "white" {}
        _PosterizeValue ("PosterizeValue", Float ) = 0
        _RotationPerlin ("RotationPerlin", Float ) = 0
        [MaterialToggle] _UsePerlin ("UsePerlin", Float ) = 0
        _TransitionValue ("TransitionValue", Range(0, 1)) = 0
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
            uniform float4 _MainColor1A;
            uniform float4 _MainColor2A;
            uniform float _OutlineWidth;
            uniform float4 _MainColor2B;
            uniform float _LerpColor2;
            uniform float _LerpColor1;
            uniform float4 _MainColor1B;
            uniform float _GlobalOutlineWidth;
            uniform fixed _UseGlobalOutlineWidth;
            uniform float _Size;
            uniform sampler2D _Perlin; uniform float4 _Perlin_ST;
            uniform float _PosterizeValue;
            uniform float _RotationPerlin;
            uniform fixed _UsePerlin;
            uniform float _TransitionValue;
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
                float node_5694 = (1.0 - lerp( _OutlineWidth, _GlobalOutlineWidth, _UseGlobalOutlineWidth ));
                float node_5993_if_leA = step(node_7041,node_5694);
                float node_5993_if_leB = step(node_5694,node_7041);
                float3 node_658 = lerp(_MainColor1A.rgb,_MainColor1B.rgb,_LerpColor1);
                float3 node_2835 = lerp(_MainColor2A.rgb,_MainColor2B.rgb,_LerpColor2);
                float3 node_9284 = lerp(node_658,node_2835,_TransitionValue);
                float3 node_950 = lerp(node_2835,node_658,_TransitionValue);
                float node_8329_ang = _RotationPerlin;
                float node_8329_spd = 1.0;
                float node_8329_cos = cos(node_8329_spd*node_8329_ang);
                float node_8329_sin = sin(node_8329_spd*node_8329_ang);
                float2 node_8329_piv = float2(0.5,0.5);
                float2 node_8329 = (mul(i.uv0-node_8329_piv,float2x2( node_8329_cos, -node_8329_sin, node_8329_sin, node_8329_cos))+node_8329_piv);
                float4 _Perlin_var = tex2D(_Perlin,TRANSFORM_TEX(node_8329, _Perlin));
                float3 emissive = lerp( lerp((node_5993_if_leA*node_9284)+(node_5993_if_leB*node_950),node_9284,node_5993_if_leA*node_5993_if_leB), lerp(node_9284,node_950,floor(saturate(((node_5694*2.0+-1.0)+_Perlin_var.r)) * _PosterizeValue) / (_PosterizeValue - 1)), _UsePerlin );
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
