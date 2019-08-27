<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>marker</title>
<link rel="stylesheet" href="map.css" type="text/css" media="screen"/>
<!-- API key�� �����Ͽ� ���̿��� API URL�� �����Ͽ� ȣ�� ����  -->
<script type="text/javascript" src="http://map.vworld.kr/js/vworldMapInit.js.do?apiKey=69CE1499-E30B-3EA1-9B9F-4B9A533903BB"></script> 
<!-- <script type="text/javascript" src="/js/oriApi.js"></script> -->
<!-- API key�� �����Ͽ� ���̿��� API URL�� �����Ͽ� ȣ�ⳡ  -->

<script type="text/javascript">

var apiMap;//2D map
var SOPPlugin;//3D map
vworld.showMode = false;//���̿��� ������� ���� ��Ʈ�� ����(true:��������� ��Ʈ�� �Ҽ� �ִ� ��ư ����/false:��ư ����)
var mControl;//��Ŀ�̺�Ʈ����
var tempMarker = null;//�ӽø�Ŀ

/**
 * - rootDiv, mapType, mapFunc, 3D initCall, 3D failCall
 * - ���̿��� 5���� �Ķ���͸� �����Ͽ� ���� ȣ��
 */
vworld.init("vMap", "map-first", 
	function() {        
		apiMap = this.vmap;//���̿���� apiMap�� ���� 
		apiMap.setBaseLayer(apiMap.vworldBaseMap);//�⺻�� ���� 
		apiMap.setControlsType({"simpleMap":true});	//������ ȭ��
		apiMap.addVWORLDControl("zoomBar");//panzoombar���
		apiMap.setCenterAndZoom(14243425.793355, 4342305.8698004, 7);//ȭ���߽����� ������ �̵� (�ʱ� ȭ���߽����� ����) 	
	},
	function (obj){//3D initCall(����)
		SOPPlugin = obj;
	},
	function (msg){//3D failCall(����)
		alert(msg);
	}
);

/**
 * ���ֵ� �̵� �� ��Ŀ���
 */
function moveMarker(){
	var popupContentHTML = "";
	popupContentHTML += "<div id='areaInfoWrap'>";
	popupContentHTML += "<div id='areaTitle'>";
	popupContentHTML += "<img src='/images/list_search.png' class='listIcon' />�Ѷ��";
	popupContentHTML += "</div>";
	popupContentHTML += "<div id='areaInfo'>";
	popupContentHTML += "<strong><p>������</p>������ ���� �� 15����</strong>";
	popupContentHTML += "<strong><p>��ȭ������</p>210,230��</strong>";
	popupContentHTML += "<strong><p>�������</p>11,460��</strong>";
	popupContentHTML += "<strong><p><a herf=# onclick=hpLink('http://www.hallasan.go.kr/')>�Ѷ��Ȩ������</a></p></strong>";
	popupContentHTML += "</div>";
	popupContentHTML += "</div>";
	
	//�ش���ǥ�� ���� �̵� �� ��ǳ�� ���� ǥ��
	addMarker("14085127.637547", "3943457.6969034", popupContentHTML, null);
	
	//�ش���ǥ�� ���� �̵� �� ���� �̵�
	apiMap.setCenterAndZoom(14085127.637547, 3943457.6969034, 11); 
	document.getElementById("vm_pop").style.width = "800px";
}

/**
 * Ȩ������ �̵�
 * @param link
 * @returns {Boolean}
 */
function hpLink(link){
	  if(link == undefined || link == ""){
		  alert("Ȩ�������� �����ϴ�.");
		  return false;
	  }else{
		  window.open(""+link+"", "��ũ"); 
	  }
	  
}
 
/**
 * ��ǳ�����
 */
function addMarker(lon, lat, message, imgurl){
	var marker = new vworld.Marker(lon, lat,message,"");
	
	// ��Ŀ ������ �̹��� ���ϸ� �����մϴ�.
	if (typeof imgurl == 'string') {marker.setIconImage(imgurl);}
	
	// ��Ŀ�� z-Index ����
	marker.setZindex(3);
	
	apiMap.addMarker(marker);
	tempMarker = marker; 
}
</script>
</head>
<body>

<!-- ������ �� ���� ���� -->
<div id="vMap" style="width:100%;height:650px;left:0px;top:0px"></div>
<!-- ������ �� ���� �� -->

<!-- chart control -->
<div id="desc" style="padding:5px 0 0 5px;">
	<button type="button" onclick="javascript:moveMarker();" name="addpin" >���ֵ�</button>
</div>
<!-- chart control -->
</body>
</html>