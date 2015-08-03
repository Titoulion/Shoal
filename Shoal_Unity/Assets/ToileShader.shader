// Shader created with Shader Forge v1.17 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.17;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:3138,x:41450,y:32901,varname:node_3138,prsc:2|emission-2347-OUT,clip-6502-OUT;n:type:ShaderForge.SFN_Tex2d,id:7606,x:38310,y:32900,ptovrint:False,ptlb:Render,ptin:_Render,varname:node_7606,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-4548-OUT;n:type:ShaderForge.SFN_TexCoord,id:2864,x:32513,y:32833,varname:node_2864,prsc:2,uv:0;n:type:ShaderForge.SFN_Vector2,id:2565,x:32697,y:32949,varname:node_2565,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Distance,id:4021,x:32698,y:32818,varname:node_4021,prsc:2|A-2864-UVOUT,B-2565-OUT;n:type:ShaderForge.SFN_Multiply,id:5097,x:32921,y:32805,varname:node_5097,prsc:2|A-4021-OUT,B-2032-OUT;n:type:ShaderForge.SFN_Vector1,id:2032,x:32808,y:33029,varname:node_2032,prsc:2,v1:2;n:type:ShaderForge.SFN_If,id:6372,x:34962,y:32427,varname:node_6372,prsc:2|A-5097-OUT,B-4232-OUT,GT-6974-OUT,EQ-6974-OUT,LT-5656-OUT;n:type:ShaderForge.SFN_OneMinus,id:4232,x:33388,y:32980,varname:node_4232,prsc:2|IN-5568-OUT;n:type:ShaderForge.SFN_Slider,id:5568,x:32821,y:33231,ptovrint:False,ptlb:EdgeWidth,ptin:_EdgeWidth,varname:node_5568,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.05,cur:0.05,max:1;n:type:ShaderForge.SFN_Relay,id:6974,x:35824,y:32791,varname:node_6974,prsc:2|IN-4033-OUT;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:3623,x:34344,y:33339,varname:node_3623,prsc:2|IN-1719-OUT,IMIN-5235-OUT,IMAX-9757-OUT,OMIN-6011-OUT,OMAX-9757-OUT;n:type:ShaderForge.SFN_Vector1,id:9757,x:34004,y:33335,varname:node_9757,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:6011,x:33780,y:33311,varname:node_6011,prsc:2,v1:0;n:type:ShaderForge.SFN_Posterize,id:3946,x:34763,y:33725,varname:node_3946,prsc:2|IN-3413-R,STPS-8099-OUT;n:type:ShaderForge.SFN_Tex2d,id:3413,x:34763,y:33968,ptovrint:False,ptlb:Perlin,ptin:_Perlin,varname:node_3413,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-7372-OUT;n:type:ShaderForge.SFN_Lerp,id:7484,x:34651,y:33495,varname:node_7484,prsc:2|A-5656-OUT,B-6553-OUT,T-8126-OUT;n:type:ShaderForge.SFN_Lerp,id:8881,x:35049,y:33006,varname:node_8881,prsc:2|A-6822-OUT,B-6553-OUT,T-6287-OUT;n:type:ShaderForge.SFN_If,id:4033,x:35374,y:32925,varname:node_4033,prsc:2|A-1719-OUT,B-5235-OUT,GT-8881-OUT,EQ-6822-OUT,LT-6822-OUT;n:type:ShaderForge.SFN_Multiply,id:9056,x:33307,y:33358,varname:node_9056,prsc:2|A-5568-OUT,B-6193-OUT;n:type:ShaderForge.SFN_Vector1,id:6193,x:33218,y:33529,varname:node_6193,prsc:2,v1:0.5;n:type:ShaderForge.SFN_OneMinus,id:5235,x:33490,y:33214,cmnt:MiddleEdge,varname:node_5235,prsc:2|IN-9056-OUT;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:5083,x:33794,y:33823,varname:node_5083,prsc:2|IN-1719-OUT,IMIN-4232-OUT,IMAX-5235-OUT,OMIN-6011-OUT,OMAX-9757-OUT;n:type:ShaderForge.SFN_Lerp,id:6822,x:34856,y:33331,cmnt:HalfInside,varname:node_6822,prsc:2|A-5656-OUT,B-7484-OUT,T-9044-OUT;n:type:ShaderForge.SFN_Clamp01,id:1719,x:33115,y:32934,varname:node_1719,prsc:2|IN-5097-OUT;n:type:ShaderForge.SFN_Multiply,id:6389,x:35220,y:33504,varname:node_6389,prsc:2|A-3623-OUT,B-3339-OUT,C-4512-OUT;n:type:ShaderForge.SFN_Pi,id:3339,x:35491,y:33615,varname:node_3339,prsc:2;n:type:ShaderForge.SFN_Vector1,id:4512,x:35220,y:33677,varname:node_4512,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Cos,id:832,x:35462,y:33425,varname:node_832,prsc:2|IN-6389-OUT;n:type:ShaderForge.SFN_Relay,id:9802,x:34661,y:33094,varname:node_9802,prsc:2|IN-564-OUT;n:type:ShaderForge.SFN_Relay,id:9044,x:34149,y:33873,varname:node_9044,prsc:2|IN-7727-OUT;n:type:ShaderForge.SFN_Multiply,id:2264,x:33964,y:34008,varname:node_2264,prsc:2|A-5083-OUT,B-5034-OUT,C-3198-OUT;n:type:ShaderForge.SFN_Pi,id:5034,x:33774,y:34076,varname:node_5034,prsc:2;n:type:ShaderForge.SFN_Vector1,id:3198,x:33816,y:34187,varname:node_3198,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Cos,id:3739,x:34174,y:33972,varname:node_3739,prsc:2|IN-2264-OUT;n:type:ShaderForge.SFN_OneMinus,id:7727,x:34430,y:33972,varname:node_7727,prsc:2|IN-3739-OUT;n:type:ShaderForge.SFN_OneMinus,id:564,x:35674,y:33412,varname:node_564,prsc:2|IN-832-OUT;n:type:ShaderForge.SFN_Slider,id:8099,x:34358,y:33840,ptovrint:False,ptlb:PosterizeStrength,ptin:_PosterizeStrength,varname:node_8099,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:255;n:type:ShaderForge.SFN_TexCoord,id:8180,x:34540,y:34141,varname:node_8180,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:4729,x:34813,y:34141,varname:node_4729,prsc:2|A-8180-UVOUT,B-2960-OUT;n:type:ShaderForge.SFN_Append,id:2960,x:35015,y:34285,varname:node_2960,prsc:2|A-7767-OUT,B-4989-OUT;n:type:ShaderForge.SFN_Time,id:6441,x:34603,y:34311,varname:node_6441,prsc:2;n:type:ShaderForge.SFN_Multiply,id:7767,x:34892,y:34266,varname:node_7767,prsc:2|A-6441-TSL,B-48-OUT;n:type:ShaderForge.SFN_Multiply,id:4989,x:34836,y:34410,varname:node_4989,prsc:2|A-6441-TSL,B-6929-OUT;n:type:ShaderForge.SFN_Vector1,id:48,x:35170,y:34182,varname:node_48,prsc:2,v1:0.27;n:type:ShaderForge.SFN_Vector1,id:6929,x:35276,y:34309,varname:node_6929,prsc:2,v1:-0.13;n:type:ShaderForge.SFN_Relay,id:6553,x:34602,y:32948,varname:node_6553,prsc:2|IN-2285-OUT;n:type:ShaderForge.SFN_Clamp01,id:6287,x:34856,y:33077,varname:node_6287,prsc:2|IN-9802-OUT;n:type:ShaderForge.SFN_Color,id:258,x:34820,y:32249,ptovrint:False,ptlb:OutsideColor1,ptin:_OutsideColor1,varname:node_258,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Clamp01,id:8126,x:34876,y:33612,varname:node_8126,prsc:2|IN-3946-OUT;n:type:ShaderForge.SFN_Color,id:3927,x:35191,y:31985,ptovrint:False,ptlb:ColorCentre,ptin:_ColorCentre,varname:node_3927,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Relay,id:5656,x:34204,y:32973,varname:node_5656,prsc:2|IN-7014-OUT;n:type:ShaderForge.SFN_Blend,id:7024,x:38825,y:32819,varname:node_7024,prsc:2,blmd:1,clmp:True|SRC-7606-RGB,DST-6612-OUT;n:type:ShaderForge.SFN_Vector3,id:2285,x:34662,y:32818,varname:node_2285,prsc:2,v1:0,v2:0,v3:0;n:type:ShaderForge.SFN_Vector3,id:7014,x:34179,y:33070,varname:node_7014,prsc:2,v1:1,v2:1,v3:1;n:type:ShaderForge.SFN_Lerp,id:8465,x:35394,y:32168,varname:node_8465,prsc:2|A-2354-OUT,B-3927-RGB,T-2414-OUT;n:type:ShaderForge.SFN_ComponentMask,id:3544,x:35236,y:32453,varname:node_3544,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-6372-OUT;n:type:ShaderForge.SFN_Clamp01,id:2414,x:35416,y:32448,varname:node_2414,prsc:2|IN-3544-OUT;n:type:ShaderForge.SFN_Tex2d,id:340,x:34594,y:32199,ptovrint:False,ptlb:Perlin2,ptin:_Perlin2,varname:node_340,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-7372-OUT;n:type:ShaderForge.SFN_Color,id:659,x:34853,y:32056,ptovrint:False,ptlb:OutsideColor2,ptin:_OutsideColor2,varname:node_659,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Lerp,id:2354,x:35050,y:32274,varname:node_2354,prsc:2|A-659-RGB,B-258-RGB,T-340-R;n:type:ShaderForge.SFN_Tex2d,id:6902,x:33049,y:32162,ptovrint:False,ptlb:Perlin3,ptin:_Perlin3,varname:node_6902,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:6170,x:34197,y:32032,varname:node_6170,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:7372,x:34376,y:31961,varname:node_7372,prsc:2|A-6170-UVOUT,B-6323-OUT;n:type:ShaderForge.SFN_Append,id:6323,x:34362,y:32220,varname:node_6323,prsc:2|A-8494-OUT,B-1416-OUT;n:type:ShaderForge.SFN_Multiply,id:1651,x:33872,y:32252,varname:node_1651,prsc:2|A-1548-OUT,B-7525-OUT;n:type:ShaderForge.SFN_Tau,id:7525,x:33729,y:32304,varname:node_7525,prsc:2;n:type:ShaderForge.SFN_Cos,id:9792,x:34035,y:32272,varname:node_9792,prsc:2|IN-1651-OUT;n:type:ShaderForge.SFN_Sin,id:6812,x:34017,y:32420,varname:node_6812,prsc:2|IN-1651-OUT;n:type:ShaderForge.SFN_Multiply,id:8494,x:34172,y:32333,varname:node_8494,prsc:2|A-9792-OUT,B-3180-OUT;n:type:ShaderForge.SFN_Multiply,id:1416,x:34256,y:32387,varname:node_1416,prsc:2|A-6812-OUT,B-3180-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3180,x:34404,y:32451,ptovrint:False,ptlb:Distort,ptin:_Distort,varname:node_3180,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Time,id:680,x:33356,y:32457,varname:node_680,prsc:2;n:type:ShaderForge.SFN_Add,id:1548,x:33536,y:32304,varname:node_1548,prsc:2|A-6902-R,B-1590-OUT;n:type:ShaderForge.SFN_Multiply,id:1590,x:33557,y:32496,varname:node_1590,prsc:2|A-680-TSL,B-6122-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6122,x:33472,y:32610,ptovrint:False,ptlb:SpeedDistort,ptin:_SpeedDistort,varname:node_6122,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Append,id:1663,x:36279,y:31983,varname:node_1663,prsc:2|A-1719-OUT,B-3689-OUT;n:type:ShaderForge.SFN_Vector1,id:3689,x:36378,y:32146,varname:node_3689,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Tex2d,id:5538,x:36542,y:31983,ptovrint:False,ptlb:Ramp,ptin:_Ramp,varname:node_5538,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-1663-OUT;n:type:ShaderForge.SFN_Blend,id:6612,x:35874,y:32307,varname:node_6612,prsc:2,blmd:10,clmp:True|SRC-5538-RGB,DST-8465-OUT;n:type:ShaderForge.SFN_If,id:2866,x:37705,y:32980,varname:node_2866,prsc:2|A-5097-OUT,B-5442-OUT,GT-4484-OUT,EQ-4484-OUT,LT-4508-OUT;n:type:ShaderForge.SFN_Vector1,id:5442,x:35902,y:33881,varname:node_5442,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:4484,x:36505,y:32887,varname:node_4484,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:4508,x:36473,y:32968,varname:node_4508,prsc:2,v1:1;n:type:ShaderForge.SFN_SwitchProperty,id:6502,x:39667,y:33096,ptovrint:False,ptlb:DiskShape,ptin:_DiskShape,varname:node_6502,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-4982-OUT,B-2866-OUT;n:type:ShaderForge.SFN_Vector1,id:4982,x:38921,y:33225,varname:node_4982,prsc:2,v1:1;n:type:ShaderForge.SFN_Tex2d,id:9180,x:37168,y:31513,ptovrint:False,ptlb:WaterEffect,ptin:_WaterEffect,varname:node_9180,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:4970,x:38220,y:31193,varname:node_4970,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:4469,x:38640,y:31266,varname:node_4469,prsc:2|A-4970-UVOUT,B-2408-OUT;n:type:ShaderForge.SFN_Append,id:2408,x:38385,y:31381,varname:node_2408,prsc:2|A-9137-OUT,B-1583-OUT;n:type:ShaderForge.SFN_Multiply,id:1615,x:37895,y:31413,varname:node_1615,prsc:2|A-6494-OUT,B-620-OUT;n:type:ShaderForge.SFN_Tau,id:620,x:37752,y:31465,varname:node_620,prsc:2;n:type:ShaderForge.SFN_Cos,id:1762,x:38058,y:31433,varname:node_1762,prsc:2|IN-1615-OUT;n:type:ShaderForge.SFN_Sin,id:5037,x:38040,y:31581,varname:node_5037,prsc:2|IN-1615-OUT;n:type:ShaderForge.SFN_Multiply,id:9137,x:38248,y:31456,varname:node_9137,prsc:2|A-1762-OUT,B-4749-OUT,C-4842-OUT;n:type:ShaderForge.SFN_Multiply,id:1583,x:38292,y:31632,varname:node_1583,prsc:2|A-5037-OUT,B-4749-OUT,C-4842-OUT;n:type:ShaderForge.SFN_Time,id:733,x:37379,y:31618,varname:node_733,prsc:2;n:type:ShaderForge.SFN_Add,id:6494,x:37559,y:31465,varname:node_6494,prsc:2|A-9180-R,B-9538-OUT;n:type:ShaderForge.SFN_Multiply,id:9538,x:37580,y:31657,varname:node_9538,prsc:2|A-733-TSL,B-4464-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4464,x:37766,y:31716,ptovrint:False,ptlb:SpeedWater,ptin:_SpeedWater,varname:node_4464,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:4749,x:37962,y:31757,ptovrint:False,ptlb:DistortWater,ptin:_DistortWater,varname:node_4749,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Vector1,id:4842,x:37748,y:31832,varname:node_4842,prsc:2,v1:0.01;n:type:ShaderForge.SFN_Tex2d,id:1793,x:39275,y:32126,ptovrint:False,ptlb:Perlin4,ptin:_Perlin4,varname:node_1793,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-3752-OUT;n:type:ShaderForge.SFN_Posterize,id:3997,x:39939,y:32168,varname:node_3997,prsc:2|IN-6308-OUT,STPS-58-OUT;n:type:ShaderForge.SFN_ValueProperty,id:58,x:40146,y:32126,ptovrint:False,ptlb:PosterizationWaves,ptin:_PosterizationWaves,varname:node_58,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Blend,id:2347,x:40642,y:32737,varname:node_2347,prsc:2,blmd:1,clmp:True|SRC-7024-OUT,DST-7471-OUT;n:type:ShaderForge.SFN_Add,id:8563,x:39522,y:32128,varname:node_8563,prsc:2|A-1793-R,B-740-OUT;n:type:ShaderForge.SFN_Slider,id:740,x:39574,y:32063,ptovrint:False,ptlb:TransparenceWaves,ptin:_TransparenceWaves,varname:node_740,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Clamp01,id:6308,x:39701,y:32128,varname:node_6308,prsc:2|IN-8563-OUT;n:type:ShaderForge.SFN_Relay,id:6581,x:38855,y:32217,varname:node_6581,prsc:2|IN-4469-OUT;n:type:ShaderForge.SFN_Add,id:3752,x:38970,y:32217,varname:node_3752,prsc:2|A-6581-OUT,B-6751-OUT;n:type:ShaderForge.SFN_Time,id:3006,x:38447,y:32329,varname:node_3006,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9142,x:38796,y:32270,varname:node_9142,prsc:2|A-3006-TSL,B-4051-OUT;n:type:ShaderForge.SFN_Multiply,id:9359,x:38859,y:32421,varname:node_9359,prsc:2|A-3006-TSL,B-9859-OUT;n:type:ShaderForge.SFN_Vector1,id:9859,x:38696,y:32480,varname:node_9859,prsc:2,v1:0.87;n:type:ShaderForge.SFN_Vector1,id:4051,x:38662,y:32239,varname:node_4051,prsc:2,v1:-0.55;n:type:ShaderForge.SFN_Append,id:6751,x:38987,y:32336,varname:node_6751,prsc:2|A-9142-OUT,B-9359-OUT;n:type:ShaderForge.SFN_Lerp,id:7471,x:39848,y:32545,varname:node_7471,prsc:2|A-7469-RGB,B-7211-OUT,T-601-OUT;n:type:ShaderForge.SFN_Vector3,id:7211,x:39581,y:32523,varname:node_7211,prsc:2,v1:1,v2:1,v3:1;n:type:ShaderForge.SFN_Color,id:7469,x:40293,y:32368,ptovrint:False,ptlb:ColorWaves,ptin:_ColorWaves,varname:node_7469,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Tex2d,id:5804,x:36716,y:32390,ptovrint:False,ptlb:DistortRenderTexture,ptin:_DistortRenderTexture,varname:_WaterEffect_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:5208,x:37816,y:31942,varname:node_5208,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:4548,x:38236,y:32015,varname:node_4548,prsc:2|A-5208-UVOUT,B-4142-OUT;n:type:ShaderForge.SFN_Append,id:4142,x:37981,y:32130,varname:node_4142,prsc:2|A-9654-OUT,B-7982-OUT;n:type:ShaderForge.SFN_Multiply,id:9064,x:37491,y:32162,varname:node_9064,prsc:2|A-6028-OUT,B-4137-OUT;n:type:ShaderForge.SFN_Tau,id:4137,x:37348,y:32214,varname:node_4137,prsc:2;n:type:ShaderForge.SFN_Cos,id:5556,x:37654,y:32182,varname:node_5556,prsc:2|IN-9064-OUT;n:type:ShaderForge.SFN_Sin,id:7782,x:37636,y:32330,varname:node_7782,prsc:2|IN-9064-OUT;n:type:ShaderForge.SFN_Multiply,id:9654,x:37844,y:32205,varname:node_9654,prsc:2|A-5556-OUT,B-1737-OUT,C-7588-OUT;n:type:ShaderForge.SFN_Multiply,id:7982,x:37888,y:32381,varname:node_7982,prsc:2|A-7782-OUT,B-1737-OUT,C-7588-OUT;n:type:ShaderForge.SFN_Time,id:2648,x:36927,y:32495,varname:node_2648,prsc:2;n:type:ShaderForge.SFN_Add,id:6028,x:37155,y:32214,varname:node_6028,prsc:2|A-5804-R,B-8898-OUT;n:type:ShaderForge.SFN_Multiply,id:8898,x:37176,y:32406,varname:node_8898,prsc:2|A-2648-TSL,B-4938-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4938,x:37362,y:32465,ptovrint:False,ptlb:SpeedDistoRender,ptin:_SpeedDistoRender,varname:_SpeedWater_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:1737,x:37558,y:32506,ptovrint:False,ptlb:DistortRender,ptin:_DistortRender,varname:_DistortWater_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Vector1,id:7588,x:37344,y:32581,varname:node_7588,prsc:2,v1:0.01;n:type:ShaderForge.SFN_Clamp01,id:601,x:40233,y:32175,varname:node_601,prsc:2|IN-3997-OUT;proporder:7606-5568-3413-8099-258-3927-340-659-6902-3180-6122-5538-6502-9180-4464-4749-1793-58-740-7469-5804-4938-1737;pass:END;sub:END;*/

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
        [MaterialToggle] _DiskShape ("DiskShape", Float ) = 1
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
            uniform fixed _DiskShape;
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
                float node_5097 = (distance(i.uv0,float2(0.5,0.5))*2.0);
                float node_2866_if_leA = step(node_5097,1.0);
                float node_2866_if_leB = step(1.0,node_5097);
                float node_4484 = 0.0;
                clip(lerp( 1.0, lerp((node_2866_if_leA*1.0)+(node_2866_if_leB*node_4484),node_4484,node_2866_if_leA*node_2866_if_leB), _DiskShape ) - 0.5);
////// Lighting:
////// Emissive:
                float4 _DistortRenderTexture_var = tex2D(_DistortRenderTexture,TRANSFORM_TEX(i.uv0, _DistortRenderTexture));
                float4 node_2648 = _Time + _TimeEditor;
                float node_9064 = ((_DistortRenderTexture_var.r+(node_2648.r*_SpeedDistoRender))*6.28318530718);
                float node_7588 = 0.01;
                float2 node_4548 = (i.uv0+float2((cos(node_9064)*_DistortRender*node_7588),(sin(node_9064)*_DistortRender*node_7588)));
                float4 _Render_var = tex2D(_Render,TRANSFORM_TEX(node_4548, _Render));
                float node_1719 = saturate(node_5097);
                float2 node_1663 = float2(node_1719,0.5);
                float4 _Ramp_var = tex2D(_Ramp,TRANSFORM_TEX(node_1663, _Ramp));
                float4 _Perlin3_var = tex2D(_Perlin3,TRANSFORM_TEX(i.uv0, _Perlin3));
                float4 node_680 = _Time + _TimeEditor;
                float node_1651 = ((_Perlin3_var.r+(node_680.r*_SpeedDistort))*6.28318530718);
                float2 node_7372 = (i.uv0+float2((cos(node_1651)*_Distort),(sin(node_1651)*_Distort)));
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
                float4 _WaterEffect_var = tex2D(_WaterEffect,TRANSFORM_TEX(i.uv0, _WaterEffect));
                float4 node_733 = _Time + _TimeEditor;
                float node_1615 = ((_WaterEffect_var.r+(node_733.r*_SpeedWater))*6.28318530718);
                float node_4842 = 0.01;
                float4 node_3006 = _Time + _TimeEditor;
                float2 node_3752 = ((i.uv0+float2((cos(node_1615)*_DistortWater*node_4842),(sin(node_1615)*_DistortWater*node_4842)))+float2((node_3006.r*(-0.55)),(node_3006.r*0.87)));
                float4 _Perlin4_var = tex2D(_Perlin4,TRANSFORM_TEX(node_3752, _Perlin4));
                float3 emissive = saturate((saturate((_Render_var.rgb*saturate(( lerp(lerp(_OutsideColor2.rgb,_OutsideColor1.rgb,_Perlin2_var.r),_ColorCentre.rgb,saturate(lerp((node_6372_if_leA*node_5656)+(node_6372_if_leB*node_6974),node_6974,node_6372_if_leA*node_6372_if_leB).r)) > 0.5 ? (1.0-(1.0-2.0*(lerp(lerp(_OutsideColor2.rgb,_OutsideColor1.rgb,_Perlin2_var.r),_ColorCentre.rgb,saturate(lerp((node_6372_if_leA*node_5656)+(node_6372_if_leB*node_6974),node_6974,node_6372_if_leA*node_6372_if_leB).r))-0.5))*(1.0-_Ramp_var.rgb)) : (2.0*lerp(lerp(_OutsideColor2.rgb,_OutsideColor1.rgb,_Perlin2_var.r),_ColorCentre.rgb,saturate(lerp((node_6372_if_leA*node_5656)+(node_6372_if_leB*node_6974),node_6974,node_6372_if_leA*node_6372_if_leB).r))*_Ramp_var.rgb) ))))*lerp(_ColorWaves.rgb,float3(1,1,1),saturate(floor(saturate((_Perlin4_var.r+_TransparenceWaves)) * _PosterizationWaves) / (_PosterizationWaves - 1)))));
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
            uniform fixed _DiskShape;
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
                float node_5097 = (distance(i.uv0,float2(0.5,0.5))*2.0);
                float node_2866_if_leA = step(node_5097,1.0);
                float node_2866_if_leB = step(1.0,node_5097);
                float node_4484 = 0.0;
                clip(lerp( 1.0, lerp((node_2866_if_leA*1.0)+(node_2866_if_leB*node_4484),node_4484,node_2866_if_leA*node_2866_if_leB), _DiskShape ) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
