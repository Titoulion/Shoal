// Shader created with Shader Forge v1.17 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.17;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:3138,x:35805,y:32274,varname:node_3138,prsc:2|emission-6372-OUT;n:type:ShaderForge.SFN_Tex2d,id:7606,x:33860,y:33063,ptovrint:False,ptlb:Render,ptin:_Render,varname:node_7606,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:3622,x:32284,y:32926,ptovrint:False,ptlb:Perlin,ptin:_Perlin,varname:node_3622,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:2864,x:32513,y:32833,varname:node_2864,prsc:2,uv:0;n:type:ShaderForge.SFN_Vector2,id:2565,x:32697,y:32949,varname:node_2565,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Distance,id:4021,x:32698,y:32818,varname:node_4021,prsc:2|A-2864-UVOUT,B-2565-OUT;n:type:ShaderForge.SFN_Multiply,id:5097,x:32921,y:32805,varname:node_5097,prsc:2|A-4021-OUT,B-2032-OUT;n:type:ShaderForge.SFN_Vector1,id:2032,x:32808,y:33029,varname:node_2032,prsc:2,v1:2;n:type:ShaderForge.SFN_If,id:6372,x:35328,y:32371,varname:node_6372,prsc:2|A-5097-OUT,B-4232-OUT,GT-6974-OUT,EQ-6974-OUT,LT-7606-RGB;n:type:ShaderForge.SFN_OneMinus,id:4232,x:33388,y:32980,varname:node_4232,prsc:2|IN-5568-OUT;n:type:ShaderForge.SFN_Slider,id:5568,x:32821,y:33231,ptovrint:False,ptlb:EdgeWidth,ptin:_EdgeWidth,varname:node_5568,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.05,cur:0.05,max:1;n:type:ShaderForge.SFN_Relay,id:6974,x:35552,y:32901,varname:node_6974,prsc:2|IN-4033-OUT;n:type:ShaderForge.SFN_Color,id:1349,x:34484,y:32866,ptovrint:False,ptlb:ColorOutside,ptin:_ColorOutside,varname:node_1349,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:3623,x:34484,y:33094,varname:node_3623,prsc:2|IN-1719-OUT,IMIN-5235-OUT,IMAX-9757-OUT,OMIN-6011-OUT,OMAX-9757-OUT;n:type:ShaderForge.SFN_Vector1,id:9757,x:34004,y:33335,varname:node_9757,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:6011,x:33780,y:33311,varname:node_6011,prsc:2,v1:0;n:type:ShaderForge.SFN_Posterize,id:3946,x:34763,y:33725,varname:node_3946,prsc:2|IN-3413-R,STPS-8099-OUT;n:type:ShaderForge.SFN_Tex2d,id:3413,x:34763,y:33968,ptovrint:False,ptlb:Perlin,ptin:_Perlin,varname:node_3413,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-4729-OUT;n:type:ShaderForge.SFN_Lerp,id:7484,x:34404,y:33578,varname:node_7484,prsc:2|A-7606-RGB,B-1349-RGB,T-3946-OUT;n:type:ShaderForge.SFN_Lerp,id:8881,x:35038,y:32999,varname:node_8881,prsc:2|A-6822-OUT,B-1349-RGB,T-9802-OUT;n:type:ShaderForge.SFN_If,id:4033,x:35374,y:32925,varname:node_4033,prsc:2|A-1719-OUT,B-5235-OUT,GT-8881-OUT,EQ-6822-OUT,LT-6822-OUT;n:type:ShaderForge.SFN_Multiply,id:9056,x:33307,y:33358,varname:node_9056,prsc:2|A-5568-OUT,B-6193-OUT;n:type:ShaderForge.SFN_Vector1,id:6193,x:33218,y:33529,varname:node_6193,prsc:2,v1:0.5;n:type:ShaderForge.SFN_OneMinus,id:5235,x:33528,y:33249,cmnt:MiddleEdge,varname:node_5235,prsc:2|IN-9056-OUT;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:5083,x:33750,y:33905,varname:node_5083,prsc:2|IN-1719-OUT,IMIN-4232-OUT,IMAX-5235-OUT,OMIN-6011-OUT,OMAX-9757-OUT;n:type:ShaderForge.SFN_Lerp,id:6822,x:34845,y:33317,cmnt:HalfInside,varname:node_6822,prsc:2|A-7606-RGB,B-7484-OUT,T-9044-OUT;n:type:ShaderForge.SFN_Clamp01,id:1719,x:33115,y:32934,varname:node_1719,prsc:2|IN-5097-OUT;n:type:ShaderForge.SFN_Multiply,id:6389,x:35220,y:33504,varname:node_6389,prsc:2|A-3623-OUT,B-3339-OUT,C-4512-OUT;n:type:ShaderForge.SFN_Pi,id:3339,x:35491,y:33615,varname:node_3339,prsc:2;n:type:ShaderForge.SFN_Vector1,id:4512,x:35220,y:33677,varname:node_4512,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Cos,id:832,x:35462,y:33425,varname:node_832,prsc:2|IN-6389-OUT;n:type:ShaderForge.SFN_Relay,id:9802,x:34661,y:33094,varname:node_9802,prsc:2|IN-564-OUT;n:type:ShaderForge.SFN_Relay,id:9044,x:33939,y:33905,varname:node_9044,prsc:2|IN-7727-OUT;n:type:ShaderForge.SFN_Multiply,id:2264,x:33964,y:34008,varname:node_2264,prsc:2|A-5083-OUT,B-5034-OUT,C-3198-OUT;n:type:ShaderForge.SFN_Pi,id:5034,x:34235,y:34119,varname:node_5034,prsc:2;n:type:ShaderForge.SFN_Vector1,id:3198,x:33964,y:34181,varname:node_3198,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Cos,id:3739,x:34206,y:33929,varname:node_3739,prsc:2|IN-2264-OUT;n:type:ShaderForge.SFN_OneMinus,id:7727,x:34430,y:33972,varname:node_7727,prsc:2|IN-3739-OUT;n:type:ShaderForge.SFN_OneMinus,id:564,x:35674,y:33412,varname:node_564,prsc:2|IN-832-OUT;n:type:ShaderForge.SFN_Slider,id:8099,x:34358,y:33840,ptovrint:False,ptlb:PosterizeStrength,ptin:_PosterizeStrength,varname:node_8099,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:255;n:type:ShaderForge.SFN_TexCoord,id:8180,x:34540,y:34141,varname:node_8180,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:4729,x:34813,y:34141,varname:node_4729,prsc:2|A-8180-UVOUT,B-2960-OUT;n:type:ShaderForge.SFN_Append,id:2960,x:35015,y:34285,varname:node_2960,prsc:2|A-7767-OUT,B-4989-OUT;n:type:ShaderForge.SFN_Time,id:6441,x:34603,y:34311,varname:node_6441,prsc:2;n:type:ShaderForge.SFN_Multiply,id:7767,x:34892,y:34266,varname:node_7767,prsc:2|A-6441-TSL,B-48-OUT;n:type:ShaderForge.SFN_Multiply,id:4989,x:34836,y:34410,varname:node_4989,prsc:2|A-6441-TSL,B-6929-OUT;n:type:ShaderForge.SFN_Vector1,id:48,x:35170,y:34182,varname:node_48,prsc:2,v1:0.27;n:type:ShaderForge.SFN_Vector1,id:6929,x:35276,y:34309,varname:node_6929,prsc:2,v1:-0.13;proporder:7606-5568-1349-3413-8099;pass:END;sub:END;*/

Shader "Shader Forge/ToileShader" {
    Properties {
        _Render ("Render", 2D) = "white" {}
        _EdgeWidth ("EdgeWidth", Range(0.05, 1)) = 0.05
        _ColorOutside ("ColorOutside", Color) = (0.5,0.5,0.5,1)
        _Perlin ("Perlin", 2D) = "white" {}
        _PosterizeStrength ("PosterizeStrength", Range(0, 255)) = 0
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
            uniform float4 _TimeEditor;
            uniform sampler2D _Render; uniform float4 _Render_ST;
            uniform float _EdgeWidth;
            uniform float4 _ColorOutside;
            uniform sampler2D _Perlin; uniform float4 _Perlin_ST;
            uniform float _PosterizeStrength;
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
                float node_5097 = (distance(i.uv0,float2(0.5,0.5))*2.0);
                float node_4232 = (1.0 - _EdgeWidth);
                float node_6372_if_leA = step(node_5097,node_4232);
                float node_6372_if_leB = step(node_4232,node_5097);
                float4 _Render_var = tex2D(_Render,TRANSFORM_TEX(i.uv0, _Render));
                float node_1719 = saturate(node_5097);
                float node_5235 = (1.0 - (_EdgeWidth*0.5)); // MiddleEdge
                float node_4033_if_leA = step(node_1719,node_5235);
                float node_4033_if_leB = step(node_5235,node_1719);
                float4 node_6441 = _Time + _TimeEditor;
                float2 node_4729 = (i.uv0+float2((node_6441.r*0.27),(node_6441.r*(-0.13))));
                float4 _Perlin_var = tex2D(_Perlin,TRANSFORM_TEX(node_4729, _Perlin));
                float node_6011 = 0.0;
                float node_9757 = 1.0;
                float3 node_6822 = lerp(_Render_var.rgb,lerp(_Render_var.rgb,_ColorOutside.rgb,floor(_Perlin_var.r * _PosterizeStrength) / (_PosterizeStrength - 1)),(1.0 - cos(((node_6011 + ( (node_1719 - node_4232) * (node_9757 - node_6011) ) / (node_5235 - node_4232))*3.141592654*0.5)))); // HalfInside
                float3 node_6974 = lerp((node_4033_if_leA*node_6822)+(node_4033_if_leB*lerp(node_6822,_ColorOutside.rgb,(1.0 - cos(((node_6011 + ( (node_1719 - node_5235) * (node_9757 - node_6011) ) / (node_9757 - node_5235))*3.141592654*0.5))))),node_6822,node_4033_if_leA*node_4033_if_leB);
                float3 emissive = lerp((node_6372_if_leA*_Render_var.rgb)+(node_6372_if_leB*node_6974),node_6974,node_6372_if_leA*node_6372_if_leB);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
