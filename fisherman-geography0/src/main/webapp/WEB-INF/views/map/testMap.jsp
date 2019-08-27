<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>marker</title>
<link rel="stylesheet" href="map.css" type="text/css" media="screen"/>
<!-- API key를 포함하여 브이월드 API URL을 지정하여 호출 시작  -->
<script type="text/javascript" src="http://map.vworld.kr/js/vworldMapInit.js.do?apiKey=69CE1499-E30B-3EA1-9B9F-4B9A533903BB"></script> 
<!-- <script type="text/javascript" src="/js/oriApi.js"></script> -->
<!-- API key를 포함하여 브이월드 API URL을 지정하여 호출끝  -->

<script type="text/javascript">

var apiMap;//2D map
var SOPPlugin;//3D map
vworld.showMode = false;//브이월드 배경지도 설정 컨트롤 유무(true:배경지도를 컨트롤 할수 있는 버튼 생성/false:버튼 해제)
var mControl;//마커이벤트변수
var tempMarker = null;//임시마커

/**
 * - rootDiv, mapType, mapFunc, 3D initCall, 3D failCall
 * - 브이월드 5가지 파라미터를 셋팅하여 지도 호출
 */
vworld.init("vMap", "map-first", 
	function() {        
		apiMap = this.vmap;//브이월드맵 apiMap에 셋팅 
		apiMap.setBaseLayer(apiMap.vworldBaseMap);//기본맵 설정 
		apiMap.setControlsType({"simpleMap":true});	//간단한 화면
		apiMap.addVWORLDControl("zoomBar");//panzoombar등록
		apiMap.setCenterAndZoom(14243425.793355, 4342305.8698004, 7);//화면중심점과 레벨로 이동 (초기 화면중심점과 레벨) 	
	},
	function (obj){//3D initCall(성공)
		SOPPlugin = obj;
	},
	function (msg){//3D failCall(실패)
		alert(msg);
	}
);

/**
 * 제주도 이동 및 마커찍기
 */
function moveMarker(){
	var popupContentHTML = "";
	popupContentHTML += "<div id='areaInfoWrap'>";
	popupContentHTML += "<div id='areaTitle'>";
	popupContentHTML += "<img src='/images/list_search.png' class='listIcon' />한라산";
	popupContentHTML += "</div>";
	popupContentHTML += "<div id='areaInfo'>";
	popupContentHTML += "<strong><p>소재지</p>서귀포 토평동 산 15번지</strong>";
	popupContentHTML += "<strong><p>분화구면적</p>210,230㎡</strong>";
	popupContentHTML += "<strong><p>담수면적</p>11,460㎡</strong>";
	popupContentHTML += "<strong><p><a herf=# onclick=hpLink('http://www.hallasan.go.kr/')>한라산홈페이지</a></p></strong>";
	popupContentHTML += "</div>";
	popupContentHTML += "</div>";
	
	//해당좌표로 지도 이동 및 말풍선 내용 표기
	addMarker("14085127.637547", "3943457.6969034", popupContentHTML, null);
	
	//해당좌표로 지도 이동 및 레벨 이동
	apiMap.setCenterAndZoom(14085127.637547, 3943457.6969034, 11); 
	document.getElementById("vm_pop").style.width = "800px";
}

/**
 * 홈페이지 이동
 * @param link
 * @returns {Boolean}
 */
function hpLink(link){
	  if(link == undefined || link == ""){
		  alert("홈페이지가 없습니다.");
		  return false;
	  }else{
		  window.open(""+link+"", "링크"); 
	  }
	  
}
 
/**
 * 말풍선결과
 */
function addMarker(lon, lat, message, imgurl){
	var marker = new vworld.Marker(lon, lat,message,"");
	
	// 마커 아이콘 이미지 파일명 설정합니다.
	if (typeof imgurl == 'string') {marker.setIconImage(imgurl);}
	
	// 마커의 z-Index 설정
	marker.setZindex(3);
	
	apiMap.addMarker(marker);
	tempMarker = marker; 
}
</script>
</head>
<body>

<!-- 지도가 들어갈 영역 시작 -->
<div id="vMap" style="width:100%;height:650px;left:0px;top:0px"></div>
<!-- 지도가 들어갈 영역 끝 -->

<!-- chart control -->
<div id="desc" style="padding:5px 0 0 5px;">
	<button type="button" onclick="javascript:moveMarker();" name="addpin" >제주도</button>
</div>
<!-- chart control -->
</body>
</html>