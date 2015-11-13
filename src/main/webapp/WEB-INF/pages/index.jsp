<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tag" uri="/WEB-INF/taglibs/customTaglib.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv="Cache-Control" content="no-cache">
  <meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">
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

  <script language="JavaScript" type="text/javascript">
    function confirmDelete() {
      if (confirm("Really delete this user?")) {
        return true;
      } else {
        return false;
      }
    }
   </script>
</head>
<body>
<div class="container">
  <h1><a href="/UsersManager/">List of users</a></h1>
  <c:url var="searchUrl" value="/search"/>
  <form:form modelAttribute="userAttribute" method="GET" action="${searchUrl}" class="navbar-form navbar-left" role="search">
    <div class="form-group">

      <select class="form-control" name="searchBy">
        <option
                <c:if test="${searchBy == 'id'}">selected</c:if> value="id">Id
        </option>
        <option
                <c:if test="${searchBy == 'name'}">selected</c:if> value="name">Name
        </option>
        <option
                <c:if test="${searchBy == 'age'}">selected</c:if> value="age">Age
        </option>
        <option
                <c:if test="${searchBy == 'createdDate'}">selected</c:if> value="createdDate">Created date
        </option>
        <option
                <c:if test="${searchBy == 'isAdmin'}">selected</c:if> value="isAdmin">isAdmin (write 1 or 0)
        </option>
      </select>

      <input name="searchString" type="text" class="form-control" placeholder="Write search string" value="${searchString}">

    </div>
    <button type="submit" class="btn btn-default">Submit</button>
  </form:form>

  <table class="table" width="60%">
    <tr>
      <th>Id</th>
      <th>Name</th>
      <th>Age</th>
      <th>Created date</th>
      <th>Is admin</th>
      <th>Edit</th>
      <th>Delete</th>
    </tr>
    <c:forEach var="p" items="${users}">
      <tr>
        <td>${p.id}</td>
        <td>${p.name}</td>
        <td>${p.age}</td>
        <td>${fn:substring(p.createdDate, 0, 10)}</td>
        <td>${p.admin}</td>
        <td><a href="./users/edit?id=${p.id}" class="glyphicon glyphicon-pencil" aria-hidden="true"></a></td>
        <td><a href="./users/delete?id=${p.id}" onClick="return confirmDelete();" class="glyphicon glyphicon-remove" aria-hidden="true"></a></td>
      </tr>
    </c:forEach>
  </table>

  <span class="glyphicon glyphicon-plus" aria-hidden="true"></span><a href="./users/add">Add new user</a>
  <c:url var="urlForTag" value="./"/>
  <c:if test="${searchBy != null}"> <c:url var="urlForTag"
                                           value="/search?${requestScope['javax.servlet.forward.query_string']}"/>
  </c:if>
  <tag:paginate max="10" offset="${offset}" count="${count}"
                uri="${urlForTag}" next="&raquo;" previous="&laquo;"/>
</div>
</body>
</html>