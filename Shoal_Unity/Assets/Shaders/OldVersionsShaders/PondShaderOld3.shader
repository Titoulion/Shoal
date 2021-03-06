// Shader created with Shader Forge v1.17 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.17;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:3138,x:41186,y:32820,varname:node_3138,prsc:2|emission-2347-OUT,alpha-9060-OUT;n:type:ShaderForge.SFN_Tex2d,id:7606,x:38105,y:32550,ptovrint:False,ptlb:Render,ptin:_Render,varname:node_7606,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-4548-OUT;n:type:ShaderForge.SFN_TexCoord,id:2864,x:32330,y:32675,varname:node_2864,prsc:2,uv:0;n:type:ShaderForge.SFN_Vector2,id:2565,x:32330,y:32815,varname:node_2565,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Distance,id:4021,x:32498,y:32743,varname:node_4021,prsc:2|A-2864-UVOUT,B-2565-OUT;n:type:ShaderForge.SFN_Multiply,id:5097,x:32667,y:32743,varname:node_5097,prsc:2|A-4021-OUT,B-2032-OUT;n:type:ShaderForge.SFN_Vector1,id:2032,x:32667,y:32684,varname:node_2032,prsc:2,v1:2;n:type:ShaderForge.SFN_If,id:6372,x:34962,y:32427,varname:node_6372,prsc:2|A-5097-OUT,B-4232-OUT,GT-6974-OUT,EQ-6974-OUT,LT-5656-OUT;n:type:ShaderForge.SFN_OneMinus,id:4232,x:33388,y:32980,varname:node_4232,prsc:2|IN-5568-OUT;n:type:ShaderForge.SFN_Slider,id:5568,x:32821,y:33231,ptovrint:False,ptlb:EdgeWidth,ptin:_EdgeWidth,varname:node_5568,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.05,cur:0.05,max:1;n:type:ShaderForge.SFN_Relay,id:6974,x:35824,y:32791,varname:node_6974,prsc:2|IN-4033-OUT;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:3623,x:34344,y:33339,varname:node_3623,prsc:2|IN-1719-OUT,IMIN-5235-OUT,IMAX-9757-OUT,OMIN-6011-OUT,OMAX-9757-OUT;n:type:ShaderForge.SFN_Vector1,id:9757,x:34004,y:33335,varname:node_9757,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:6011,x:33780,y:33311,varname:node_6011,prsc:2,v1:0;n:type:ShaderForge.SFN_Posterize,id:3946,x:34763,y:33725,varname:node_3946,prsc:2|IN-3413-R,STPS-8099-OUT;n:type:ShaderForge.SFN_Tex2d,id:3413,x:34526,y:33666,ptovrint:False,ptlb:Perlin,ptin:_Perlin,varname:node_3413,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-7372-OUT;n:type:ShaderForge.SFN_Lerp,id:7484,x:34651,y:33495,varname:node_7484,prsc:2|A-5656-OUT,B-6553-OUT,T-8126-OUT;n:type:ShaderForge.SFN_Lerp,id:8881,x:35049,y:33006,varname:node_8881,prsc:2|A-6822-OUT,B-6553-OUT,T-6287-OUT;n:type:ShaderForge.SFN_If,id:4033,x:35374,y:32925,varname:node_4033,prsc:2|A-1719-OUT,B-5235-OUT,GT-8881-OUT,EQ-6822-OUT,LT-6822-OUT;n:type:ShaderForge.SFN_Multiply,id:9056,x:33307,y:33358,varname:node_9056,prsc:2|A-5568-OUT,B-6193-OUT;n:type:ShaderForge.SFN_Vector1,id:6193,x:33218,y:33529,varname:node_6193,prsc:2,v1:0.5;n:type:ShaderForge.SFN_OneMinus,id:5235,x:33490,y:33214,cmnt:MiddleEdge,varname:node_5235,prsc:2|IN-9056-OUT;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:5083,x:33794,y:33823,varname:node_5083,prsc:2|IN-1719-OUT,IMIN-4232-OUT,IMAX-5235-OUT,OMIN-6011-OUT,OMAX-9757-OUT;n:type:ShaderForge.SFN_Lerp,id:6822,x:34856,y:33331,cmnt:HalfInside,varname:node_6822,prsc:2|A-5656-OUT,B-7484-OUT,T-9044-OUT;n:type:ShaderForge.SFN_Clamp01,id:1719,x:32831,y:32847,varname:node_1719,prsc:2|IN-5097-OUT;n:type:ShaderForge.SFN_Multiply,id:6389,x:35220,y:33504,varname:node_6389,prsc:2|A-3623-OUT,B-3339-OUT,C-4512-OUT;n:type:ShaderForge.SFN_Pi,id:3339,x:35491,y:33615,varname:node_3339,prsc:2;n:type:ShaderForge.SFN_Vector1,id:4512,x:35220,y:33677,varname:node_4512,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Cos,id:832,x:35462,y:33425,varname:node_832,prsc:2|IN-6389-OUT;n:type:ShaderForge.SFN_Relay,id:9802,x:34661,y:33094,varname:node_9802,prsc:2|IN-564-OUT;n:type:ShaderForge.SFN_Relay,id:9044,x:34149,y:33873,varname:node_9044,prsc:2|IN-7727-OUT;n:type:ShaderForge.SFN_Multiply,id:2264,x:33964,y:34008,varname:node_2264,prsc:2|A-5083-OUT,B-5034-OUT,C-3198-OUT;n:type:ShaderForge.SFN_Pi,id:5034,x:33774,y:34076,varname:node_5034,prsc:2;n:type:ShaderForge.SFN_Vector1,id:3198,x:33816,y:34187,varname:node_3198,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Cos,id:3739,x:34174,y:33972,varname:node_3739,prsc:2|IN-2264-OUT;n:type:ShaderForge.SFN_OneMinus,id:7727,x:34430,y:33972,varname:node_7727,prsc:2|IN-3739-OUT;n:type:ShaderForge.SFN_OneMinus,id:564,x:35674,y:33412,varname:node_564,prsc:2|IN-832-OUT;n:type:ShaderForge.SFN_Slider,id:8099,x:34416,y:33842,ptovrint:False,ptlb:PosterizeStrength,ptin:_PosterizeStrength,varname:node_8099,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:255;n:type:ShaderForge.SFN_Relay,id:6553,x:34602,y:32948,varname:node_6553,prsc:2|IN-2285-OUT;n:type:ShaderForge.SFN_Clamp01,id:6287,x:34856,y:33077,varname:node_6287,prsc:2|IN-9802-OUT;n:type:ShaderForge.SFN_Color,id:258,x:35408,y:32307,ptovrint:False,ptlb:OutsideColor1,ptin:_OutsideColor1,varname:node_258,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Clamp01,id:8126,x:34952,y:33625,varname:node_8126,prsc:2|IN-3946-OUT;n:type:ShaderForge.SFN_Color,id:3927,x:35792,y:32115,ptovrint:False,ptlb:ColorCentre,ptin:_ColorCentre,varname:node_3927,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Relay,id:5656,x:34204,y:32973,varname:node_5656,prsc:2|IN-7014-OUT;n:type:ShaderForge.SFN_Blend,id:7024,x:38751,y:32606,varname:node_7024,prsc:2,blmd:1,clmp:True|SRC-6833-OUT,DST-7606-RGB;n:type:ShaderForge.SFN_Vector3,id:2285,x:34662,y:32818,varname:node_2285,prsc:2,v1:0,v2:0,v3:0;n:type:ShaderForge.SFN_Vector3,id:7014,x:34179,y:33070,varname:node_7014,prsc:2,v1:1,v2:1,v3:1;n:type:ShaderForge.SFN_Lerp,id:8465,x:36093,y:32245,varname:node_8465,prsc:2|A-2354-OUT,B-3927-RGB,T-2414-OUT;n:type:ShaderForge.SFN_ComponentMask,id:3544,x:35236,y:32453,varname:node_3544,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-6372-OUT;n:type:ShaderForge.SFN_Clamp01,id:2414,x:35656,y:32453,varname:node_2414,prsc:2|IN-3544-OUT;n:type:ShaderForge.SFN_Tex2d,id:340,x:34715,y:31944,ptovrint:False,ptlb:Perlin2,ptin:_Perlin2,varname:node_340,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-7372-OUT;n:type:ShaderForge.SFN_Color,id:659,x:35394,y:32141,ptovrint:False,ptlb:OutsideColor2,ptin:_OutsideColor2,varname:node_659,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Lerp,id:2354,x:35573,y:32277,varname:node_2354,prsc:2|A-659-RGB,B-258-RGB,T-340-R;n:type:ShaderForge.SFN_Tex2d,id:6902,x:33416,y:32001,ptovrint:False,ptlb:Perlin3,ptin:_Perlin3,varname:node_6902,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:6170,x:34358,y:32073,varname:node_6170,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:7372,x:34523,y:32167,varname:node_7372,prsc:2|A-6170-UVOUT,B-6323-OUT;n:type:ShaderForge.SFN_Append,id:6323,x:34358,y:32216,varname:node_6323,prsc:2|A-8494-OUT,B-1416-OUT;n:type:ShaderForge.SFN_Multiply,id:1651,x:33795,y:32081,varname:node_1651,prsc:2|A-1548-OUT,B-7525-OUT;n:type:ShaderForge.SFN_Tau,id:7525,x:33650,y:32219,varname:node_7525,prsc:2;n:type:ShaderForge.SFN_Cos,id:9792,x:34001,y:32045,varname:node_9792,prsc:2|IN-1651-OUT;n:type:ShaderForge.SFN_Sin,id:6812,x:34001,y:32270,varname:node_6812,prsc:2|IN-1651-OUT;n:type:ShaderForge.SFN_Multiply,id:8494,x:34195,y:32137,varname:node_8494,prsc:2|A-9792-OUT,B-3180-OUT;n:type:ShaderForge.SFN_Multiply,id:1416,x:34195,y:32290,varname:node_1416,prsc:2|A-3180-OUT,B-6812-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3180,x:34001,y:32214,ptovrint:False,ptlb:Distort,ptin:_Distort,varname:node_3180,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Time,id:680,x:33254,y:32115,varname:node_680,prsc:2;n:type:ShaderForge.SFN_Add,id:1548,x:33617,y:32081,varname:node_1548,prsc:2|A-6902-R,B-1590-OUT;n:type:ShaderForge.SFN_Multiply,id:1590,x:33416,y:32159,varname:node_1590,prsc:2|A-680-TSL,B-6122-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6122,x:33254,y:32263,ptovrint:False,ptlb:SpeedDistort,ptin:_SpeedDistort,varname:node_6122,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Append,id:1663,x:35807,y:31903,varname:node_1663,prsc:2|A-1719-OUT,B-3689-OUT;n:type:ShaderForge.SFN_Vector1,id:3689,x:35530,y:31986,varname:node_3689,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Tex2d,id:5538,x:37287,y:32449,ptovrint:False,ptlb:Ramp,ptin:_Ramp,varname:node_5538,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-1663-OUT;n:type:ShaderForge.SFN_Blend,id:6612,x:38038,y:32735,varname:node_6612,prsc:2,blmd:10,clmp:True|SRC-5538-RGB,DST-8465-OUT;n:type:ShaderForge.SFN_If,id:2866,x:39040,y:33542,varname:node_2866,prsc:2|A-5097-OUT,B-5442-OUT,GT-4484-OUT,EQ-4484-OUT,LT-4508-OUT;n:type:ShaderForge.SFN_Vector1,id:5442,x:38048,y:33855,varname:node_5442,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:4484,x:37918,y:34018,varname:node_4484,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:4508,x:37886,y:34099,varname:node_4508,prsc:2,v1:1;n:type:ShaderForge.SFN_Tex2d,id:9180,x:37949,y:30846,ptovrint:False,ptlb:WaterEffect,ptin:_WaterEffect,varname:node_9180,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:4970,x:39001,y:30526,varname:node_4970,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:4469,x:39421,y:30599,varname:node_4469,prsc:2|A-4970-UVOUT,B-2408-OUT;n:type:ShaderForge.SFN_Append,id:2408,x:39166,y:30714,varname:node_2408,prsc:2|A-9137-OUT,B-1583-OUT;n:type:ShaderForge.SFN_Multiply,id:1615,x:38676,y:30746,varname:node_1615,prsc:2|A-6494-OUT,B-620-OUT;n:type:ShaderForge.SFN_Tau,id:620,x:38533,y:30798,varname:node_620,prsc:2;n:type:ShaderForge.SFN_Cos,id:1762,x:38839,y:30766,varname:node_1762,prsc:2|IN-1615-OUT;n:type:ShaderForge.SFN_Sin,id:5037,x:38821,y:30914,varname:node_5037,prsc:2|IN-1615-OUT;n:type:ShaderForge.SFN_Multiply,id:9137,x:39029,y:30789,varname:node_9137,prsc:2|A-1762-OUT,B-4749-OUT,C-4842-OUT;n:type:ShaderForge.SFN_Multiply,id:1583,x:39073,y:30965,varname:node_1583,prsc:2|A-5037-OUT,B-4749-OUT,C-4842-OUT;n:type:ShaderForge.SFN_Time,id:733,x:38160,y:30951,varname:node_733,prsc:2;n:type:ShaderForge.SFN_Add,id:6494,x:38340,y:30798,varname:node_6494,prsc:2|A-9180-R,B-9538-OUT;n:type:ShaderForge.SFN_Multiply,id:9538,x:38361,y:30990,varname:node_9538,prsc:2|A-733-TSL,B-4464-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4464,x:38547,y:31049,ptovrint:False,ptlb:SpeedWater,ptin:_SpeedWater,varname:node_4464,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:4749,x:38743,y:31090,ptovrint:False,ptlb:DistortWater,ptin:_DistortWater,varname:node_4749,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Vector1,id:4842,x:38529,y:31165,varname:node_4842,prsc:2,v1:0.01;n:type:ShaderForge.SFN_Tex2d,id:1793,x:39275,y:32126,ptovrint:False,ptlb:Perlin4,ptin:_Perlin4,varname:node_1793,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-3752-OUT;n:type:ShaderForge.SFN_Posterize,id:3997,x:39939,y:32168,varname:node_3997,prsc:2|IN-6308-OUT,STPS-58-OUT;n:type:ShaderForge.SFN_ValueProperty,id:58,x:40146,y:32126,ptovrint:False,ptlb:PosterizationWaves,ptin:_PosterizationWaves,varname:node_58,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Blend,id:2347,x:40245,y:32921,varname:node_2347,prsc:2,blmd:1,clmp:True|SRC-7024-OUT,DST-7471-OUT;n:type:ShaderForge.SFN_Add,id:8563,x:39522,y:32128,varname:node_8563,prsc:2|A-1793-R,B-740-OUT;n:type:ShaderForge.SFN_Slider,id:740,x:39574,y:32063,ptovrint:False,ptlb:TransparenceWaves,ptin:_TransparenceWaves,varname:node_740,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Clamp01,id:6308,x:39701,y:32128,varname:node_6308,prsc:2|IN-8563-OUT;n:type:ShaderForge.SFN_Relay,id:6581,x:39302,y:31461,varname:node_6581,prsc:2|IN-4469-OUT;n:type:ShaderForge.SFN_Add,id:3752,x:39417,y:31461,varname:node_3752,prsc:2|A-6581-OUT,B-6751-OUT;n:type:ShaderForge.SFN_Time,id:3006,x:39079,y:31585,varname:node_3006,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9142,x:39243,y:31514,varname:node_9142,prsc:2|A-3006-TSL,B-4051-OUT;n:type:ShaderForge.SFN_Multiply,id:9359,x:39306,y:31665,varname:node_9359,prsc:2|A-3006-TSL,B-9859-OUT;n:type:ShaderForge.SFN_Vector1,id:9859,x:39143,y:31724,varname:node_9859,prsc:2,v1:0.87;n:type:ShaderForge.SFN_Vector1,id:4051,x:39109,y:31483,varname:node_4051,prsc:2,v1:-0.55;n:type:ShaderForge.SFN_Append,id:6751,x:39434,y:31580,varname:node_6751,prsc:2|A-9142-OUT,B-9359-OUT;n:type:ShaderForge.SFN_Lerp,id:7471,x:39848,y:32545,varname:node_7471,prsc:2|A-7469-RGB,B-7211-OUT,T-601-OUT;n:type:ShaderForge.SFN_Vector3,id:7211,x:39581,y:32523,varname:node_7211,prsc:2,v1:1,v2:1,v3:1;n:type:ShaderForge.SFN_Color,id:7469,x:40301,y:32329,ptovrint:False,ptlb:ColorWaves,ptin:_ColorWaves,varname:node_7469,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Tex2d,id:5804,x:36964,y:31702,ptovrint:False,ptlb:DistortRenderTexture,ptin:_DistortRenderTexture,varname:_WaterEffect_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:5208,x:38288,y:31662,varname:node_5208,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:4548,x:38612,y:31839,varname:node_4548,prsc:2|A-5208-UVOUT,B-4142-OUT;n:type:ShaderForge.SFN_Append,id:4142,x:38325,y:32034,varname:node_4142,prsc:2|A-9654-OUT,B-7982-OUT;n:type:ShaderForge.SFN_Multiply,id:9064,x:37579,y:31794,varname:node_9064,prsc:2|A-6028-OUT,B-4137-OUT;n:type:ShaderForge.SFN_Tau,id:4137,x:37428,y:31870,varname:node_4137,prsc:2;n:type:ShaderForge.SFN_Cos,id:5556,x:37830,y:31597,varname:node_5556,prsc:2|IN-9064-OUT;n:type:ShaderForge.SFN_Sin,id:7782,x:37756,y:32106,varname:node_7782,prsc:2|IN-9064-OUT;n:type:ShaderForge.SFN_Multiply,id:9654,x:38092,y:31765,varname:node_9654,prsc:2|A-5556-OUT,B-1737-OUT,C-7588-OUT;n:type:ShaderForge.SFN_Multiply,id:7982,x:38068,y:32205,varname:node_7982,prsc:2|A-7782-OUT,B-1737-OUT,C-7588-OUT;n:type:ShaderForge.SFN_Time,id:2648,x:36911,y:31935,varname:node_2648,prsc:2;n:type:ShaderForge.SFN_Add,id:6028,x:37331,y:31726,varname:node_6028,prsc:2|A-5804-R,B-8898-OUT;n:type:ShaderForge.SFN_Multiply,id:8898,x:37216,y:31990,varname:node_8898,prsc:2|A-2648-TSL,B-4938-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4938,x:36970,y:32081,ptovrint:False,ptlb:SpeedDistoRender,ptin:_SpeedDistoRender,varname:_SpeedWater_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:1737,x:38036,y:32034,ptovrint:False,ptlb:DistortRender,ptin:_DistortRender,varname:_DistortWater_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Vector1,id:7588,x:37832,y:31997,varname:node_7588,prsc:2,v1:0.01;n:type:ShaderForge.SFN_Clamp01,id:601,x:40233,y:32175,varname:node_601,prsc:2|IN-3997-OUT;n:type:ShaderForge.SFN_Multiply,id:9060,x:40138,y:33467,varname:node_9060,prsc:2|A-6132-OUT,B-2866-OUT;n:type:ShaderForge.SFN_ComponentMask,id:6132,x:37104,y:32936,varname:node_6132,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-2414-OUT;n:type:ShaderForge.SFN_Blend,id:6833,x:38475,y:32652,varname:node_6833,prsc:2,blmd:1,clmp:True|SRC-6612-OUT,DST-1176-RGB;n:type:ShaderForge.SFN_Color,id:1176,x:38231,y:32906,ptovrint:False,ptlb:node_1176,ptin:_node_1176,varname:node_1176,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Lerp,id:1371,x:39111,y:33043,varname:node_1371,prsc:2|A-5538-RGB,B-7606-RGB,T-6132-OUT;proporder:7606-5568-3413-8099-258-3927-340-659-6902-3180-6122-5538-9180-4464-4749-1793-58-740-7469-5804-4938-1737-1176;pass:END;sub:END;*/

Shader "Shader Forge/ToileShader" {
    Properties {
        _Render ("Render", 2D) = "white" {}
        _EdgeWidth ("EdgeWidth", Range(0.05, 1)) = 0.05
        _Perlin ("Perlin", 2D) = "white" {}
        _PosterizeStrength ("PosterizeStrength", Range(0, 255)) = 0
        _OutsideColor1 ("OutsideColor1", Color) = (0.5,0.5,0.5,1)
        _ColorCentre ("ColorCentre", Color) = (0.5,0.5,0.5,1)
        _Perlin2 ("Perlin2", 2D) = "white" {}
        _OutsideColor2 ("OutsideColor2", Color) = (0.5,0.5,0.5,1)
        _Perlin3 ("Perlin3", 2D) = "white" {}
        _Distort ("Distort", Float ) = 0
        _SpeedDistort ("SpeedDistort", Float ) = 0
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
        _node_1176 ("node_1176", Color) = (0.5,0.5,0.5,1)
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
            uniform float4 _OutsideColor1;
            uniform float4 _ColorCentre;
            uniform sampler2D _Perlin2; uniform float4 _Perlin2_ST;
            uniform float4 _OutsideColor2;
            uniform sampler2D _Perlin3; uniform float4 _Perlin3_ST;
            uniform float _Distort;
            uniform float _SpeedDistort;
            uniform sampler2D _Ramp; uniform float4 _Ramp_ST;
            uniform sampler2D _WaterEffect; uniform float4 _WaterEffect_ST;
            uniform float _SpeedWater;
            uniform float _DistortWater;
            uniform sampler2D _Perlin4; uniform float4 _Perlin4_ST;
            uniform float _PosterizationWaves;
            uniform float _TransparenceWaves;
            uniform float4 _ColorWaves;
            uniform sampler2D _DistortRenderTexture; uniform float4 _DistortRenderTexture_ST;
            uniform float _SpeedDistoRender;
            uniform float _DistortRender;
            uniform float4 _node_1176;
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
                float node_1719 = saturate(node_5097);
                float2 node_1663 = float2(node_1719,0.5);
                float4 _Ramp_var = tex2D(_Ramp,TRANSFORM_TEX(node_1663, _Ramp));
                float4 _Perlin3_var = tex2D(_Perlin3,TRANSFORM_TEX(i.uv0, _Perlin3));
                float4 node_680 = _Time + _TimeEditor;
                float node_1651 = ((_Perlin3_var.r+(node_680.r*_SpeedDistort))*6.28318530718);
                float2 node_7372 = (i.uv0+float2((cos(node_1651)*_Distort),(_Distort*sin(node_1651))));
                float4 _Perlin2_var = tex2D(_Perlin2,TRANSFORM_TEX(node_7372, _Perlin2));
                float node_4232 = (1.0 - _EdgeWidth);
                float node_6372_if_leA = step(node_5097,node_4232);
                float node_6372_if_leB = step(node_4232,node_5097);
                float3 node_5656 = float3(1,1,1);
                float node_5235 = (1.0 - (_EdgeWidth*0.5)); // MiddleEdge
                float node_4033_if_leA = step(node_1719,node_5235);
                float node_4033_if_leB = step(node_5235,node_1719);
                float3 node_6553 = float3(0,0,0);
                float4 _Perlin_var = tex2D(_Perlin,TRANSFORM_TEX(node_7372, _Perlin));
                float node_6011 = 0.0;
                float node_9757 = 1.0;
                float3 node_6822 = lerp(node_5656,lerp(node_5656,node_6553,saturate(floor(_Perlin_var.r * _PosterizeStrength) / (_PosterizeStrength - 1))),(1.0 - cos(((node_6011 + ( (node_1719 - node_4232) * (node_9757 - node_6011) ) / (node_5235 - node_4232))*3.141592654*0.5)))); // HalfInside
                float3 node_6974 = lerp((node_4033_if_leA*node_6822)+(node_4033_if_leB*lerp(node_6822,node_6553,saturate((1.0 - cos(((node_6011 + ( (node_1719 - node_5235) * (node_9757 - node_6011) ) / (node_9757 - node_5235))*3.141592654*0.5)))))),node_6822,node_4033_if_leA*node_4033_if_leB);
                float node_2414 = saturate(lerp((node_6372_if_leA*node_5656)+(node_6372_if_leB*node_6974),node_6974,node_6372_if_leA*node_6372_if_leB).r);
                float4 _DistortRenderTexture_var = tex2D(_DistortRenderTexture,TRANSFORM_TEX(i.uv0, _DistortRenderTexture));
                float4 node_2648 = _Time + _TimeEditor;
                float node_9064 = ((_DistortRenderTexture_var.r+(node_2648.r*_SpeedDistoRender))*6.28318530718);
                float node_7588 = 0.01;
                float2 node_4548 = (i.uv0+float2((cos(node_9064)*_DistortRender*node_7588),(sin(node_9064)*_DistortRender*node_7588)));
                float4 _Render_var = tex2D(_Render,TRANSFORM_TEX(node_4548, _Render));
                float3 node_7024 = saturate((saturate((saturate(( lerp(lerp(_OutsideColor2.rgb,_OutsideColor1.rgb,_Perlin2_var.r),_ColorCentre.rgb,node_2414) > 0.5 ? (1.0-(1.0-2.0*(lerp(lerp(_OutsideColor2.rgb,_OutsideColor1.rgb,_Perlin2_var.r),_ColorCentre.rgb,node_2414)-0.5))*(1.0-_Ramp_var.rgb)) : (2.0*lerp(lerp(_OutsideColor2.rgb,_OutsideColor1.rgb,_Perlin2_var.r),_ColorCentre.rgb,node_2414)*_Ramp_var.rgb) ))*_node_1176.rgb))*_Render_var.rgb));
                float4 _WaterEffect_var = tex2D(_WaterEffect,TRANSFORM_TEX(i.uv0, _WaterEffect));
                float4 node_733 = _Time + _TimeEditor;
                float node_1615 = ((_WaterEffect_var.r+(node_733.r*_SpeedWater))*6.28318530718);
                float node_4842 = 0.01;
                float4 node_3006 = _Time + _TimeEditor;
                float2 node_3752 = ((i.uv0+float2((cos(node_1615)*_DistortWater*node_4842),(sin(node_1615)*_DistortWater*node_4842)))+float2((node_3006.r*(-0.55)),(node_3006.r*0.87)));
                float4 _Perlin4_var = tex2D(_Perlin4,TRANSFORM_TEX(node_3752, _Perlin4));
                float3 node_7471 = lerp(_ColorWaves.rgb,float3(1,1,1),saturate(floor(saturate((_Perlin4_var.r+_TransparenceWaves)) * _PosterizationWaves) / (_PosterizationWaves - 1)));
                float3 node_2347 = saturate((node_7024*node_7471));
                float3 emissive = node_2347;
                float3 finalColor = emissive;
                float node_6132 = node_2414.r;
                float node_2866_if_leA = step(node_5097,1.0);
                float node_2866_if_leB = step(1.0,node_5097);
                float node_4484 = 0.0;
                float node_2866 = lerp((node_2866_if_leA*1.0)+(node_2866_if_leB*node_4484),node_4484,node_2866_if_leA*node_2866_if_leB);
                return fixed4(finalColor,(node_6132*node_2866));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
