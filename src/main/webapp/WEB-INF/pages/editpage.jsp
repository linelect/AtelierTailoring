<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="tag" uri="/WEB-INF/taglibs/customTaglib.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>Users manager</title>
  <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
        integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ=="
        crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css"
        integrity="sha384-aUGj/X2zp5rLCbBxumKTCw2Z50WgIr1vs/PFN4praOTvYXWlVyh2UtNUU0KAUhAX" crossorigin="anonymous">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"
          integrity="sha512-K1qjQ+NcF2TYO/eI3M6v8EiNYZfA95pQumfvcVrTHtwQVDG+aHRqLi/ETn2uB+1JqwYqVG3LIvdm9lj6imS/pQ=="
          crossorigin="anonymous"></script>


</head>

<div class="container">
  <h1>Edit user information form</h1>

  <c:if test="${userEdited}"><div class="alert alert-success" role="alert">User information was updated! <a href="/UsersManager/">You can return to users list</a></div></c:if>


  <form:form modelAttribute="userAttribute" method="POST" action="/UsersManager/users/edit?id=${userAttribute.id}" class="form-horizontal">

    <spring:bind path="name">
      <div class="form-group ${status.error ? 'has-error' : ''}">
        <label for="name" class="col-sm-2 control-label">Name</label>

        <div class="col-sm-10">
          <form:input path="name" type="text" class="form-control" id="name" placeholder="Name"/>
          <form:errors path="name"/>
        </div>
      </div>
    </spring:bind>

    <spring:bind path="age">
      <div class="form-group ${status.error ? 'has-error' : ''}">
        <label for="age" class="col-sm-2 control-label">Age</label>

        <div class="col-sm-10">
          <form:input path="age" type="text" class="form-control" id="age" placeholder="Age"/>
          <form:errors path="age"/>
        </div>
      </div>
    </spring:bind>

    <div class="form-group">
      <label for="admin" class="col-sm-2 control-label">Is admin?</label>
      <div class="col-sm-10">
        <form:checkbox path="admin" id="admin"/>
      </div>
    </div>

    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default">Add</button> or <a href="/UsersManager/">return to users list</a>
      </div>
    </div>
  </form:form>


</div>
</body>
</html>
