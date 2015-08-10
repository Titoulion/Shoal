// Shader created with Shader Forge v1.17 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.17;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:3138,x:42751,y:32891,varname:node_3138,prsc:2|emission-3512-OUT,alpha-9060-OUT;n:type:ShaderForge.SFN_Tex2d,id:7606,x:39850,y:32375,ptovrint:False,ptlb:Render,ptin:_Render,varname:node_7606,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-4548-OUT;n:type:ShaderForge.SFN_TexCoord,id:2864,x:38673,y:32915,varname:node_2864,prsc:2,uv:0;n:type:ShaderForge.SFN_Vector2,id:2565,x:38673,y:33056,varname:node_2565,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Distance,id:4021,x:38853,y:32963,varname:node_4021,prsc:2|A-2864-UVOUT,B-2565-OUT;n:type:ShaderForge.SFN_Multiply,id:5097,x:39020,y:33000,varname:node_5097,prsc:2|A-4021-OUT,B-2032-OUT;n:type:ShaderForge.SFN_Vector1,id:2032,x:38853,y:33093,varname:node_2032,prsc:2,v1:2;n:type:ShaderForge.SFN_If,id:6372,x:40692,y:33765,varname:node_6372,prsc:2|A-5097-OUT,B-4232-OUT,GT-4033-OUT,EQ-4033-OUT,LT-7014-OUT;n:type:ShaderForge.SFN_OneMinus,id:4232,x:38597,y:34003,varname:node_4232,prsc:2|IN-5568-OUT;n:type:ShaderForge.SFN_Slider,id:5568,x:37989,y:34024,ptovrint:False,ptlb:EdgeWidth,ptin:_EdgeWidth,varname:node_5568,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.05,cur:0.05,max:1;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:3623,x:38915,y:33581,varname:node_3623,prsc:2|IN-1719-OUT,IMIN-5235-OUT,IMAX-9757-OUT,OMIN-7995-OUT,OMAX-9757-OUT;n:type:ShaderForge.SFN_Vector1,id:9757,x:38711,y:33634,varname:node_9757,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:6011,x:38858,y:34259,varname:node_6011,prsc:2,v1:0;n:type:ShaderForge.SFN_Posterize,id:3946,x:39576,y:34783,varname:node_3946,prsc:2|IN-3413-R,STPS-8099-OUT;n:type:ShaderForge.SFN_Tex2d,id:3413,x:39319,y:34775,ptovrint:False,ptlb:Perlin,ptin:_Perlin,varname:node_3413,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-7372-OUT;n:type:ShaderForge.SFN_Lerp,id:7484,x:39607,y:34029,varname:node_7484,prsc:2|A-1727-OUT,B-2285-OUT,T-8126-OUT;n:type:ShaderForge.SFN_Lerp,id:8881,x:40287,y:33923,varname:node_8881,prsc:2|A-6822-OUT,B-6986-OUT,T-6287-OUT;n:type:ShaderForge.SFN_If,id:4033,x:40491,y:33785,varname:node_4033,prsc:2|A-1719-OUT,B-5235-OUT,GT-8881-OUT,EQ-6822-OUT,LT-6822-OUT;n:type:ShaderForge.SFN_Multiply,id:9056,x:38311,y:34048,varname:node_9056,prsc:2|A-5568-OUT,B-6193-OUT;n:type:ShaderForge.SFN_Vector1,id:6193,x:38146,y:34103,varname:node_6193,prsc:2,v1:0.5;n:type:ShaderForge.SFN_OneMinus,id:5235,x:38711,y:33477,cmnt:MiddleEdge,varname:node_5235,prsc:2|IN-9056-OUT;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:5083,x:39094,y:34190,varname:node_5083,prsc:2|IN-1719-OUT,IMIN-4232-OUT,IMAX-5235-OUT,OMIN-6011-OUT,OMAX-6778-OUT;n:type:ShaderForge.SFN_Lerp,id:6822,x:40132,y:33875,cmnt:HalfInside,varname:node_6822,prsc:2|A-4618-OUT,B-7484-OUT,T-7727-OUT;n:type:ShaderForge.SFN_Clamp01,id:1719,x:39195,y:33000,varname:node_1719,prsc:2|IN-5097-OUT;n:type:ShaderForge.SFN_Multiply,id:6389,x:39119,y:33660,varname:node_6389,prsc:2|A-3623-OUT,B-3339-OUT,C-4512-OUT;n:type:ShaderForge.SFN_Pi,id:3339,x:38932,y:33715,varname:node_3339,prsc:2;n:type:ShaderForge.SFN_Vector1,id:4512,x:38932,y:33806,varname:node_4512,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Cos,id:832,x:39279,y:33658,varname:node_832,prsc:2|IN-6389-OUT;n:type:ShaderForge.SFN_Multiply,id:2264,x:39256,y:34316,varname:node_2264,prsc:2|A-5083-OUT,B-5034-OUT,C-3198-OUT;n:type:ShaderForge.SFN_Pi,id:5034,x:39094,y:34316,varname:node_5034,prsc:2;n:type:ShaderForge.SFN_Vector1,id:3198,x:39049,y:34425,varname:node_3198,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Cos,id:3739,x:39453,y:34316,varname:node_3739,prsc:2|IN-2264-OUT;n:type:ShaderForge.SFN_OneMinus,id:7727,x:39619,y:34316,varname:node_7727,prsc:2|IN-3739-OUT;n:type:ShaderForge.SFN_OneMinus,id:564,x:39442,y:33658,varname:node_564,prsc:2|IN-832-OUT;n:type:ShaderForge.SFN_Slider,id:8099,x:39510,y:34966,ptovrint:False,ptlb:PosterizeStrength,ptin:_PosterizeStrength,varname:node_8099,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:255;n:type:ShaderForge.SFN_Clamp01,id:6287,x:39609,y:33658,varname:node_6287,prsc:2|IN-564-OUT;n:type:ShaderForge.SFN_Clamp01,id:8126,x:39867,y:34786,varname:node_8126,prsc:2|IN-3946-OUT;n:type:ShaderForge.SFN_Vector3,id:2285,x:39382,y:34086,varname:node_2285,prsc:2,v1:0,v2:0,v3:0;n:type:ShaderForge.SFN_Vector3,id:7014,x:40491,y:33910,varname:node_7014,prsc:2,v1:1,v2:1,v3:1;n:type:ShaderForge.SFN_ComponentMask,id:3544,x:40865,y:33765,varname:node_3544,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-6372-OUT;n:type:ShaderForge.SFN_Clamp01,id:2414,x:41049,y:33753,varname:node_2414,prsc:2|IN-3544-OUT;n:type:ShaderForge.SFN_Tex2d,id:6902,x:38025,y:34608,ptovrint:False,ptlb:Perlin3,ptin:_Perlin3,varname:node_6902,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:6170,x:38967,y:34681,varname:node_6170,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:7372,x:39133,y:34775,varname:node_7372,prsc:2|A-6170-UVOUT,B-6323-OUT;n:type:ShaderForge.SFN_Append,id:6323,x:38967,y:34823,varname:node_6323,prsc:2|A-8494-OUT,B-1416-OUT;n:type:ShaderForge.SFN_Multiply,id:1651,x:38405,y:34688,varname:node_1651,prsc:2|A-1548-OUT,B-7525-OUT;n:type:ShaderForge.SFN_Tau,id:7525,x:38259,y:34826,varname:node_7525,prsc:2;n:type:ShaderForge.SFN_Cos,id:9792,x:38610,y:34653,varname:node_9792,prsc:2|IN-1651-OUT;n:type:ShaderForge.SFN_Sin,id:6812,x:38610,y:34877,varname:node_6812,prsc:2|IN-1651-OUT;n:type:ShaderForge.SFN_Multiply,id:8494,x:38804,y:34744,varname:node_8494,prsc:2|A-9792-OUT,B-3180-OUT;n:type:ShaderForge.SFN_Multiply,id:1416,x:38804,y:34898,varname:node_1416,prsc:2|A-3180-OUT,B-6812-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3180,x:38610,y:34822,ptovrint:False,ptlb:Distort,ptin:_Distort,varname:node_3180,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Add,id:1548,x:38226,y:34688,varname:node_1548,prsc:2|A-6902-R,B-1590-OUT;n:type:ShaderForge.SFN_Multiply,id:1590,x:37896,y:34743,varname:node_1590,prsc:2|A-2381-OUT,B-2421-OUT;n:type:ShaderForge.SFN_Append,id:1663,x:39835,y:32965,varname:node_1663,prsc:2|A-1719-OUT,B-3689-OUT;n:type:ShaderForge.SFN_Vector1,id:3689,x:39665,y:32999,varname:node_3689,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Tex2d,id:5538,x:40041,y:32965,ptovrint:False,ptlb:Ramp,ptin:_Ramp,varname:node_5538,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-1663-OUT;n:type:ShaderForge.SFN_If,id:2866,x:42009,y:33215,varname:node_2866,prsc:2|A-5097-OUT,B-5442-OUT,GT-4484-OUT,EQ-4484-OUT,LT-5442-OUT;n:type:ShaderForge.SFN_Vector1,id:5442,x:41787,y:33249,varname:node_5442,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:4484,x:41787,y:33312,varname:node_4484,prsc:2,v1:0;n:type:ShaderForge.SFN_Tex2d,id:9180,x:40282,y:31050,ptovrint:False,ptlb:WaterEffect,ptin:_WaterEffect,varname:node_9180,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:4970,x:41356,y:31085,varname:node_4970,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:4469,x:41528,y:31153,varname:node_4469,prsc:2|A-4970-UVOUT,B-2408-OUT;n:type:ShaderForge.SFN_Append,id:2408,x:41356,y:31231,varname:node_2408,prsc:2|A-9137-OUT,B-1583-OUT;n:type:ShaderForge.SFN_Multiply,id:1615,x:40647,y:31190,varname:node_1615,prsc:2|A-6494-OUT,B-620-OUT;n:type:ShaderForge.SFN_Tau,id:620,x:40539,y:31251,varname:node_620,prsc:2;n:type:ShaderForge.SFN_Cos,id:1762,x:40815,y:31118,varname:node_1762,prsc:2|IN-1615-OUT;n:type:ShaderForge.SFN_Sin,id:5037,x:40815,y:31266,varname:node_5037,prsc:2|IN-1615-OUT;n:type:ShaderForge.SFN_Multiply,id:9137,x:41071,y:31051,varname:node_9137,prsc:2|A-1762-OUT,B-4749-OUT,C-4842-OUT;n:type:ShaderForge.SFN_Multiply,id:1583,x:41071,y:31379,varname:node_1583,prsc:2|A-5037-OUT,B-4749-OUT,C-4842-OUT;n:type:ShaderForge.SFN_Time,id:733,x:40129,y:31215,varname:node_733,prsc:2;n:type:ShaderForge.SFN_Add,id:6494,x:40484,y:31108,varname:node_6494,prsc:2|A-9180-R,B-9538-OUT;n:type:ShaderForge.SFN_Multiply,id:9538,x:40332,y:31232,varname:node_9538,prsc:2|A-733-TSL,B-4464-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4464,x:40129,y:31371,ptovrint:False,ptlb:SpeedWater,ptin:_SpeedWater,varname:node_4464,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:4749,x:41071,y:31245,ptovrint:False,ptlb:DistortWater,ptin:_DistortWater,varname:node_4749,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Vector1,id:4842,x:41071,y:31305,varname:node_4842,prsc:2,v1:0.01;n:type:ShaderForge.SFN_Tex2d,id:1793,x:40540,y:32136,ptovrint:False,ptlb:Perlin4,ptin:_Perlin4,varname:node_1793,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-3752-OUT;n:type:ShaderForge.SFN_Posterize,id:3997,x:41245,y:32122,varname:node_3997,prsc:2|IN-6308-OUT,STPS-58-OUT;n:type:ShaderForge.SFN_ValueProperty,id:58,x:41023,y:32301,ptovrint:False,ptlb:PosterizationWaves,ptin:_PosterizationWaves,varname:node_58,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Add,id:8563,x:40839,y:32122,varname:node_8563,prsc:2|A-1793-R,B-740-OUT;n:type:ShaderForge.SFN_Slider,id:740,x:40462,y:32332,ptovrint:False,ptlb:TransparenceWaves,ptin:_TransparenceWaves,varname:node_740,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Clamp01,id:6308,x:41023,y:32122,varname:node_6308,prsc:2|IN-8563-OUT;n:type:ShaderForge.SFN_Add,id:3752,x:41874,y:31317,varname:node_3752,prsc:2|A-4469-OUT,B-6751-OUT;n:type:ShaderForge.SFN_Time,id:3006,x:41335,y:31474,varname:node_3006,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9142,x:41523,y:31379,varname:node_9142,prsc:2|A-4051-OUT,B-3006-TSL;n:type:ShaderForge.SFN_Multiply,id:9359,x:41523,y:31552,varname:node_9359,prsc:2|A-3006-TSL,B-9859-OUT;n:type:ShaderForge.SFN_Vector1,id:9859,x:41335,y:31596,varname:node_9859,prsc:2,v1:0.87;n:type:ShaderForge.SFN_Vector1,id:4051,x:41335,y:31423,varname:node_4051,prsc:2,v1:-0.55;n:type:ShaderForge.SFN_Append,id:6751,x:41691,y:31475,varname:node_6751,prsc:2|A-9142-OUT,B-9359-OUT;n:type:ShaderForge.SFN_Lerp,id:7471,x:41796,y:32077,varname:node_7471,prsc:2|A-6266-RGB,B-7211-OUT,T-2039-OUT;n:type:ShaderForge.SFN_Vector3,id:7211,x:41444,y:32030,varname:node_7211,prsc:2,v1:1,v2:1,v3:1;n:type:ShaderForge.SFN_Color,id:7469,x:41433,y:31861,ptovrint:False,ptlb:ColorWaves,ptin:_ColorWaves,varname:node_7469,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Tex2d,id:5804,x:38095,y:32263,ptovrint:False,ptlb:DistortRenderTexture,ptin:_DistortRenderTexture,varname:_WaterEffect_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:5208,x:39327,y:32278,varname:node_5208,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:4548,x:39559,y:32367,varname:node_4548,prsc:2|A-5208-UVOUT,B-4142-OUT;n:type:ShaderForge.SFN_Append,id:4142,x:39327,y:32430,varname:node_4142,prsc:2|A-9654-OUT,B-7982-OUT;n:type:ShaderForge.SFN_Multiply,id:9064,x:38478,y:32416,varname:node_9064,prsc:2|A-6028-OUT,B-4137-OUT;n:type:ShaderForge.SFN_Tau,id:4137,x:38328,y:32524,varname:node_4137,prsc:2;n:type:ShaderForge.SFN_Cos,id:5556,x:38741,y:32314,varname:node_5556,prsc:2|IN-9064-OUT;n:type:ShaderForge.SFN_Sin,id:7782,x:38741,y:32526,varname:node_7782,prsc:2|IN-9064-OUT;n:type:ShaderForge.SFN_Multiply,id:9654,x:39101,y:32317,varname:node_9654,prsc:2|A-5556-OUT,B-1737-OUT,C-7588-OUT;n:type:ShaderForge.SFN_Multiply,id:7982,x:39108,y:32586,varname:node_7982,prsc:2|A-7782-OUT,B-1737-OUT,C-7588-OUT;n:type:ShaderForge.SFN_Time,id:2648,x:37908,y:32371,varname:node_2648,prsc:2;n:type:ShaderForge.SFN_Add,id:6028,x:38295,y:32368,varname:node_6028,prsc:2|A-5804-R,B-8898-OUT;n:type:ShaderForge.SFN_Multiply,id:8898,x:38115,y:32443,varname:node_8898,prsc:2|A-2648-TSL,B-4938-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4938,x:37908,y:32549,ptovrint:False,ptlb:SpeedDistoRender,ptin:_SpeedDistoRender,varname:_SpeedWater_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:1737,x:39088,y:32497,ptovrint:False,ptlb:DistortRender,ptin:_DistortRender,varname:_DistortWater_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Vector1,id:7588,x:38886,y:32460,varname:node_7588,prsc:2,v1:0.01;n:type:ShaderForge.SFN_Clamp01,id:601,x:41422,y:32184,varname:node_601,prsc:2|IN-3997-OUT;n:type:ShaderForge.SFN_Multiply,id:9060,x:42216,y:33160,varname:node_9060,prsc:2|A-2414-OUT,B-2866-OUT;n:type:ShaderForge.SFN_Lerp,id:1371,x:41876,y:32860,varname:node_1371,prsc:2|A-2249-OUT,B-7606-RGB,T-2414-OUT;n:type:ShaderForge.SFN_Vector1,id:7995,x:38711,y:33686,varname:node_7995,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:6778,x:38858,y:34316,varname:node_6778,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector3,id:1727,x:39382,y:33990,varname:node_1727,prsc:2,v1:1,v2:1,v3:1;n:type:ShaderForge.SFN_Vector3,id:6986,x:40114,y:34015,varname:node_6986,prsc:2,v1:0,v2:0,v3:0;n:type:ShaderForge.SFN_Vector3,id:4618,x:39583,y:33939,varname:node_4618,prsc:2,v1:1,v2:1,v3:1;n:type:ShaderForge.SFN_Blend,id:2249,x:40594,y:32810,varname:node_2249,prsc:2,blmd:19,clmp:False|SRC-5538-RGB,DST-6337-OUT;n:type:ShaderForge.SFN_Color,id:6159,x:40261,y:33006,ptovrint:False,ptlb:ColorBlendRamp,ptin:_ColorBlendRamp,varname:node_6159,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:6337,x:40518,y:32981,varname:node_6337,prsc:2|A-6159-RGB,B-8464-OUT;n:type:ShaderForge.SFN_Vector1,id:8464,x:40675,y:33103,varname:node_8464,prsc:2,v1:3;n:type:ShaderForge.SFN_ValueProperty,id:2381,x:37693,y:34971,ptovrint:False,ptlb:ProgressDistort,ptin:_ProgressDistort,varname:node_2381,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Vector1,id:2421,x:37741,y:34902,varname:node_2421,prsc:2,v1:0.05;n:type:ShaderForge.SFN_Lerp,id:3512,x:42327,y:32675,varname:node_3512,prsc:2|A-7471-OUT,B-1371-OUT,T-9449-OUT;n:type:ShaderForge.SFN_If,id:9581,x:41791,y:32338,varname:node_9581,prsc:2|A-601-OUT,B-8589-OUT,GT-2039-OUT,EQ-6473-OUT,LT-6473-OUT;n:type:ShaderForge.SFN_ValueProperty,id:8589,x:41268,y:32465,ptovrint:False,ptlb:minValueWave,ptin:_minValueWave,varname:node_8589,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.9;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:2039,x:41510,y:32421,varname:node_2039,prsc:2|IN-601-OUT,IMIN-8589-OUT,IMAX-418-OUT,OMIN-6473-OUT,OMAX-8258-OUT;n:type:ShaderForge.SFN_Vector1,id:6473,x:41557,y:32465,varname:node_6473,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:418,x:41333,y:32551,varname:node_418,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:8258,x:41437,y:32644,varname:node_8258,prsc:2,v1:1;n:type:ShaderForge.SFN_Add,id:9675,x:41931,y:32473,varname:node_9675,prsc:2|A-9581-OUT,B-560-OUT;n:type:ShaderForge.SFN_Vector1,id:560,x:41791,y:32582,varname:node_560,prsc:2,v1:0.8;n:type:ShaderForge.SFN_Clamp01,id:9449,x:41993,y:32694,varname:node_9449,prsc:2|IN-9675-OUT;n:type:ShaderForge.SFN_Color,id:6266,x:41615,y:31842,ptovrint:False,ptlb:ColorGlobal3,ptin:_ColorGlobal3,varname:node_6266,prsc:2,glob:True,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;proporder:7606-5568-3413-8099-6902-3180-5538-9180-4464-4749-1793-58-740-7469-5804-4938-1737-6159-2381-8589;pass:END;sub:END;*/

Shader "Shader Forge/ToileShader" {
    Properties {
        _Render ("Render", 2D) = "white" {}
        _EdgeWidth ("EdgeWidth", Range(0.05, 1)) = 0.05
        _Perlin ("Perlin", 2D) = "white" {}
        _PosterizeStrength ("PosterizeStrength", Range(0, 255)) = 0
        _Perlin3 ("Perlin3", 2D) = "white" {}
        _Distort ("Distort", Float ) = 0
        _Ramp ("Ramp", 2D) = "white" {}
        _WaterEffect ("WaterEffect", 2D) = "white" {}
        _SpeedWater ("SpeedWater", Float ) = 0
        _DistortWater ("DistortWater", Float ) = 0
        _Perlin4 ("Perlin4", 2D) = "white" {}
        _PosterizationWaves ("PosterizationWaves", Float ) = 0
        _TransparenceWaves ("TransparenceWaves", Range(0, 1)) = 0
        _ColorWaves ("ColorWaves", Color) = (0.5,0.5,0.5,1)
        _DistortRenderTexture ("DistortRenderTexture", 2D) = "white" {}
        _SpeedDistoRender ("SpeedDistoRender", Float ) = 0
        _DistortRender ("DistortRender", Float ) = 0
        _ColorBlendRamp ("ColorBlendRamp", Color) = (0.5,0.5,0.5,1)
        _ProgressDistort ("ProgressDistort", Float ) = 0
        _minValueWave ("minValueWave", Float ) = 0.9
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
            uniform sampler2D _Render; uniform float4 _Render_ST;
            uniform float _EdgeWidth;
            uniform sampler2D _Perlin; uniform float4 _Perlin_ST;
            uniform float _PosterizeStrength;
            uniform sampler2D _Perlin3; uniform float4 _Perlin3_ST;
            uniform float _Distort;
            uniform sampler2D _Ramp; uniform float4 _Ramp_ST;
            uniform sampler2D _WaterEffect; uniform float4 _WaterEffect_ST;
            uniform float _SpeedWater;
            uniform float _DistortWater;
            uniform sampler2D _Perlin4; uniform float4 _Perlin4_ST;
            uniform float _PosterizationWaves;
            uniform float _TransparenceWaves;
            uniform sampler2D _DistortRenderTexture; uniform float4 _DistortRenderTexture_ST;
            uniform float _SpeedDistoRender;
            uniform float _DistortRender;
            uniform float4 _ColorBlendRamp;
            uniform float _ProgressDistort;
            uniform float _minValueWave;
            uniform float4 _ColorGlobal3;
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
                float4 _WaterEffect_var = tex2D(_WaterEffect,TRANSFORM_TEX(i.uv0, _WaterEffect));
                float4 node_733 = _Time + _TimeEditor;
                float node_1615 = ((_WaterEffect_var.r+(node_733.r*_SpeedWater))*6.28318530718);
                float node_4842 = 0.01;
                float4 node_3006 = _Time + _TimeEditor;
                float2 node_3752 = ((i.uv0+float2((cos(node_1615)*_DistortWater*node_4842),(sin(node_1615)*_DistortWater*node_4842)))+float2(((-0.55)*node_3006.r),(node_3006.r*0.87)));
                float4 _Perlin4_var = tex2D(_Perlin4,TRANSFORM_TEX(node_3752, _Perlin4));
                float node_601 = saturate(floor(saturate((_Perlin4_var.r+_TransparenceWaves)) * _PosterizationWaves) / (_PosterizationWaves - 1));
                float node_6473 = 0.0;
                float node_2039 = (node_6473 + ( (node_601 - _minValueWave) * (1.0 - node_6473) ) / (1.0 - _minValueWave));
                float3 node_7471 = lerp(_ColorGlobal3.rgb,float3(1,1,1),node_2039);
                float node_5097 = (distance(i.uv0,float2(0.5,0.5))*2.0);
                float node_1719 = saturate(node_5097);
                float2 node_1663 = float2(node_1719,0.5);
                float4 _Ramp_var = tex2D(_Ramp,TRANSFORM_TEX(node_1663, _Ramp));
                float4 _DistortRenderTexture_var = tex2D(_DistortRenderTexture,TRANSFORM_TEX(i.uv0, _DistortRenderTexture));
                float4 node_2648 = _Time + _TimeEditor;
                float node_9064 = ((_DistortRenderTexture_var.r+(node_2648.r*_SpeedDistoRender))*6.28318530718);
                float node_7588 = 0.01;
                float2 node_4548 = (i.uv0+float2((cos(node_9064)*_DistortRender*node_7588),(sin(node_9064)*_DistortRender*node_7588)));
                float4 _Render_var = tex2D(_Render,TRANSFORM_TEX(node_4548, _Render));
                float node_4232 = (1.0 - _EdgeWidth);
                float node_6372_if_leA = step(node_5097,node_4232);
                float node_6372_if_leB = step(node_4232,node_5097);
                float node_5235 = (1.0 - (_EdgeWidth*0.5)); // MiddleEdge
                float node_4033_if_leA = step(node_1719,node_5235);
                float node_4033_if_leB = step(node_5235,node_1719);
                float4 _Perlin3_var = tex2D(_Perlin3,TRANSFORM_TEX(i.uv0, _Perlin3));
                float node_1651 = ((_Perlin3_var.r+(_ProgressDistort*0.05))*6.28318530718);
                float2 node_7372 = (i.uv0+float2((cos(node_1651)*_Distort),(_Distort*sin(node_1651))));
                float4 _Perlin_var = tex2D(_Perlin,TRANSFORM_TEX(node_7372, _Perlin));
                float node_6011 = 0.0;
                float3 node_6822 = lerp(float3(1,1,1),lerp(float3(1,1,1),float3(0,0,0),saturate(floor(_Perlin_var.r * _PosterizeStrength) / (_PosterizeStrength - 1))),(1.0 - cos(((node_6011 + ( (node_1719 - node_4232) * (1.0 - node_6011) ) / (node_5235 - node_4232))*3.141592654*0.5)))); // HalfInside
                float node_9757 = 1.0;
                float node_7995 = 0.0;
                float3 node_4033 = lerp((node_4033_if_leA*node_6822)+(node_4033_if_leB*lerp(node_6822,float3(0,0,0),saturate((1.0 - cos(((node_7995 + ( (node_1719 - node_5235) * (node_9757 - node_7995) ) / (node_9757 - node_5235))*3.141592654*0.5)))))),node_6822,node_4033_if_leA*node_4033_if_leB);
                float node_2414 = saturate(lerp((node_6372_if_leA*float3(1,1,1))+(node_6372_if_leB*node_4033),node_4033,node_6372_if_leA*node_6372_if_leB).r);
                float3 node_1371 = lerp(((_ColorBlendRamp.rgb*3.0)-_Ramp_var.rgb),_Render_var.rgb,node_2414);
                float node_9581_if_leA = step(node_601,_minValueWave);
                float node_9581_if_leB = step(_minValueWave,node_601);
                float3 emissive = lerp(node_7471,node_1371,saturate((lerp((node_9581_if_leA*node_6473)+(node_9581_if_leB*node_2039),node_6473,node_9581_if_leA*node_9581_if_leB)+0.8)));
                float3 finalColor = emissive;
                float node_5442 = 1.0;
                float node_2866_if_leA = step(node_5097,node_5442);
                float node_2866_if_leB = step(node_5442,node_5097);
                float node_4484 = 0.0;
                return fixed4(finalColor,(node_2414*lerp((node_2866_if_leA*node_5442)+(node_2866_if_leB*node_4484),node_4484,node_2866_if_leA*node_2866_if_leB)));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
