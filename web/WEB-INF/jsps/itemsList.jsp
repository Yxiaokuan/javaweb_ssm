<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>

<script>
    function ck(){

        var inputs =$("input[type=checkbox]");
        if(inputs[0].checked==true){
            for (var i=1;i<=inputs.length;i++){
                inputs[i].checked=true;
            }

        }else{
            for (var i=1;i<=inputs.length;i++){
                inputs[i].checked=false;
            }
        }
    }
    function deletePart() {
        var ids=[];
        var inputs = document.getElementsByName("ids");
        for (var i=1;i< inputs.length;i++){
            if(inputs[i].checked==true){
                var id = inputs[i].value;
                ids.push(id);
            }

        }
        var s = JSON.stringify(ids);
        $.ajax({
            type:'post',
            url:'${pageContext.request.contextPath}/items/deletePart.do',
            contentType:'application/json;charset=utf-8',
            data:s
        });
    }
    function add() {
       location.href="${pageContext.request.contextPath}/items/add.do";
    }
</script>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>查询商品列表</title>
</head>
<body>
<form action="${pageContext.request.contextPath }/items/.do" method="post">
    查询条件：
    <table width="100%" border=1>
        <tr>
            <td><input type="submit" value="查询"/></td>
        </tr>
        <table width="100%" border=1>
        <tr>
            <td valign="middle">
          <div style="text-align:right;padding-right: 250px"><input type="button" onclick="deletePart()"  value="批量删除"/><input style="align-items: end" type="button"  onclick="add()" value="添加"/></div>
            </td>
        </tr>
    </table>
    商品列表：
    <table width="100%" border=1>
        <tr>
            <td><input type="checkbox" id="all" name="input" onclick="ck();" >全选/全不选</td>
            <td>商品名称</td>
            <td>商品图片</td>
            <td>商品价格</td>
            <td>生产日期</td>
            <td>商品描述</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${itemsList}" var="item">
            <tr>
                <td><input type="checkbox" value="${item.id }" name="ids"></td>
                <td>${item.name}</td>
                <td>
                    <img src="${item.pic}" alt="暂无图片" height="100" width="100"/>
                </td>
                <td>${item.price }</td>
                <td><fmt:formatDate value="${item.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </td>
                <td>${item.detail}</td>

                <td><a href="${pageContext.request.contextPath }/items/edit.do?id=${item.id}">修改</a>&nbsp;
                <a href="${pageContext.request.contextPath }/items/delete.do?id=${item.id}">删除</a></td>

            </tr>
        </c:forEach>

    </table>
    </table>
</form>
</body>

</html>