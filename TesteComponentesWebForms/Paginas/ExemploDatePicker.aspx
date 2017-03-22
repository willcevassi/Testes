<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExemploDatePicker.aspx.cs" Inherits="TesteComponentesWebForms.Paginas.ExemploDatePicker" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery.ui.core.min.js"></script>
    <script src="../Scripts/jquery.ui.datepicker.min.js"></script>
</head>
<body>
    <h2>Jquery DatePicker</h2>
    <form id="form1" runat="server">
        <div>
            <p>
                <asp:Label AssociatedControlID="txtDataInicial" runat="server">Data Inicial:</asp:Label>
                <asp:TextBox ID="txtDataInicial" runat="server"/>
            </p>
            <p>
                <asp:Label AssociatedControlID="txtDataFinal" runat="server">Data Final:</asp:Label>
                <asp:TextBox ID="txtDataFinal" runat="server"/>
            </p>
            <p>
                <asp:Label AssociatedControlID="txtDias" runat="server">Diferença em dias:</asp:Label>
                <asp:TextBox ID="txtDiferencaDias" runat="server"/>
            </p>
        </div>
    </form>




    <script type="text/javascript">
        $function(){

        }
        
    </script>
</body>
</html>
