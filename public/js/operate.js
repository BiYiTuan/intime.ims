$(document).ready(new function(){$("#points").change(function(){curVal=$(this).val();defaultVal=$(this).attr("amount");if(($(".currentScore").html()-curVal)<0){alert("当前可用积点不足")}else{$.post("/front/storepromotions/"+$(this).attr("info")+"/amount",{points:curVal},function(a){$(".money").html(a.amount+"元")})}});$("#exchange").click(function(){score=$("#points").val();unitScore=$("#points").attr("amount");if($("select[name=storeid]").val()=="0"){alert("请选择使用门店");return false}if(($(".currentScore").html()-score)<0){alert("当前可用积点不足");return false}if(score==0||score%unitScore!=0){alert("兑换积点必须是"+unitScore+"的整数倍");return false}if($("#identityno").val()==""){alert("请输入登记的身份证号");return false}})});function reply_comment(b,a){$(".modal-header #mLabel").html("回复`"+a+"`");$("#sourceid").val(b)};