<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<tiles:insertAttribute name="admin-sidebar" />
<div id="content-wrapper" class="d-flex flex-column">
	<div id="content">
		<tiles:insertAttribute name="admin-topbar" />
		<!-- Container Fluid-->
		<tiles:insertAttribute name="admin-content" />

		<tiles:insertAttribute name="admin-footer" />

		<!-- Page level custom scripts -->
		<script>
    $(document).ready(function () {
      $('#dataTable').DataTable(); // ID From dataTable 
      $('#dataTableHover').DataTable(); // ID From dataTable with Hover
    });
  </script>
		</body>
		</html>