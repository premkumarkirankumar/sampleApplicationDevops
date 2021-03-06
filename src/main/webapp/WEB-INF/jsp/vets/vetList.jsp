<!DOCTYPE html>

<%@ page session="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="datatables" uri="http://github.com/dandelion/datatables" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<html lang="en">

<jsp:include page="../fragments/htmlHeader.jsp"/>

<body>
<petclinic:bodyHeader menuName="vets"/>
<div class="container-fluid">
    <div class="container xd-container">
        <h2>Veterinarians3</h2>

        <datatables:table id="vets" data="${vets.vetList}" row="vet" cssClass="table table-striped"
                          pageable="false" info="false">
            <datatables:column title="Name">
                <c:out value="${vet.firstName} ${vet.lastName}"/>
            </datatables:column>
            <datatables:column title="Specialties">
                <c:forEach var="specialty" items="${vet.specialties}">
                    <c:out value="${specialty.name}"/>
                </c:forEach>
                <c:if test="${vet.nrOfSpecialties == 0}">none</c:if>
            </datatables:column>
        </datatables:table>

        <table class="table-buttons">
            <tr>
                <td>
                    <a href="<spring:url value="/vets.xml" htmlEscape="true" />">View as XML</a>
                </td>
                <td>
                    <a href="<spring:url value="/vets.json" htmlEscape="true" />">View as JSON</a>
                </td>
            </tr>
        </table>

        <petclinic:pivotal/>
    </div>
</div>
<jsp:include page="../fragments/footer.jsp"/>
</body>

</html>
