<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="jstlResult.jsp">
	<table border="1" cellpadding="3" cellspacing="0">
		<tr>
			<td>이름</td>
			<td><input type="text" id="name" name="name"></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><input type="text" id="age" name="age"></td>
		</tr>
		<tr>
			<td>색깔</td>
			<td>
				<select name="color" style="width: 100px;">
					<optgroup label="색깔">
						<option value="red">빨강</option>
						<option value="green">초록</option>
						<option value="blue">파랑</option>
						<option value="violet">보라</option>
						<option value="cyon">하늘</option>
					</optgroup>
				</select>
			</td>
		</tr>
		<tr>
			<td>취미</td>
			<td>
				<fieldset>
					<legend>취미</legend>
					<input type="checkbox" name="hobby" value="독서">독서
					<input type="checkbox" name="hobby" value="영화">영화
					<input type="checkbox" name="hobby" value="음악">음악
					<input type="checkbox" name="hobby" value="게임">게임
					<input type="checkbox" name="hobby" value="쇼핑">쇼핑
				</fieldset>
			</td>	
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="SEND">
				<input type="reset" value="CANCEL">
			</td>
		</tr>	
	</table>
</form>
</body>
</html>