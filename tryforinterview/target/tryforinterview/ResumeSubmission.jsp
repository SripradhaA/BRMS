<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="org.kie.api.task.model.TaskSummary"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resume Submission</title>
</head>
<script>
function myFunctions(processInstanceid) {   
    var a= document.getElementById("processInstanceId");
    a.value=processInstanceid;
    alert("Process Started!"+a.value);
    }
</script>
<body>
<form name="details" action="RolesAction" onsubmit="Start.disabled = true; return true;">
		
<c:if test="${requestScope.BPMSTaskComplete!=null}">
<h3>${BPMSTaskComplete }</h3>
</c:if>
User Role<input type="text" name="userRole">
		<c:if test="${requestScope.TaskSummary!=null}">
			<thead>
				<tr>
					<th>Task Id</th>
					<th>Task Name</th>
					<th>ProcessInstanceId</th>
			   </tr>
			</thead>
			<tbody>
				<c:forEach items="${TaskSummary}" var="TaskBean">

					<tr class="odd gradeA">
						<td>${TaskBean.taskId}</td>
						<td>${TaskBean.taskName}</td>
						<td>${TaskBean.processInstanceId}</td>
<td><input type="hidden" value="" name="processInstanceId" id="processInstanceId" /></td>
							
<td><input type="submit" name="action" value="Submit" id="btn${TaskBean.processInstanceId}" 
onclick="myFunctions(${TaskBean.processInstanceId})"></td>
</tr>
</c:forEach>
</tbody>
</c:if>






















	</form>

</body>
</html>