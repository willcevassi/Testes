<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DatePicker.aspx.cs" Inherits="ComponentesJQueryUI.Paginas.DatePicker" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../JS/jquery-ui-1.12.1/external/jquery/jquery.js"></script>
    <link href="../JS/jquery-ui-1.12.1/jquery-ui.css" rel="stylesheet" />
    <script src="../JS/jquery-ui-1.12.1/jquery-ui.min.js"></script>
        <script type="text/javascript">
            $(function () {

               $("#txtDataInicial").blur(function () {
                    if ($(this).value == null || $(this).value == null) {
                        document.getElementById("<%= txtDiffDias.ClientID %>").value = diffDays;
                    }
                });

               $("#txtDataFinal").blur(function () {
                   if ($(this).value == null || $(this).value == null) {
                       document.getElementById("<%= txtDiffDias.ClientID %>").value = diffDays;
                   }
               });

               $("#txtDiffDias").blur(function () {
                   if ($(this).val() == null || $(this).val() == "") {
                       document.getElementById("<%= txtDataFinal.ClientID %>").value = "";
                       return false;
                   }
        
                   var dias = parseInt($(this).val());
                   var dataInicial = $("#txtDataInicial").datepicker('getDate');

                   if (dataInicial != null) {
                       var novaData = new Date(dataInicial.getTime() + (dias * 24 * 60 * 60 * 1000));
                       document.getElementById("<%= txtDataFinal.ClientID %>").value = formatarData(novaData);
                   } else {
                       document.getElementById("<%= txtDataFinal.ClientID %>").value = null;
                   }
                 });

                $("#txtDataInicial").datepicker({
                    dateFormat: 'dd/mm/yy',
                    dayNames: ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'],
                    dayNamesMin: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'],
                    dayNamesShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb'],
                    monthNames: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
                    monthNamesShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
                    nextText: 'Próximo',
                    prevText: 'Anterior',
                    weekHeader: 'Semana',
                    onSelect: function (dateText, inst) {
                        var dateAsString = dateText; //the first parameter of this function
                        var dataFinal = $(this).datepicker('getDate');

                        var dataInicial = $("#txtDataFinal").datepicker('getDate');
                        if (dataInicial != null && dataFinal != null) {
                            var timeDiff = Math.abs(dataFinal.getTime() - dataInicial.getTime());
                            var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
                            document.getElementById("<%= txtDiffDias.ClientID %>").value = diffDays;

                    } else {
                        document.getElementById("<%= txtDiffDias.ClientID %>").value = "";
                    }

                }
                });
            });


            $(function () {
                $("#txtDataFinal").datepicker({
                    dateFormat: 'dd/mm/yy',
                    dayNames: ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'],
                    dayNamesMin: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'],
                    dayNamesShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb'],
                    monthNames: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
                    monthNamesShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
                    nextText: 'Próximo',
                    prevText: 'Anterior',
                    weekHeader: 'Semana',
                    onSelect: function (dateText, inst) {
                        var dateAsString = dateText; //the first parameter of this function
                        var dataFinal = $(this).datepicker('getDate'); //the getDate method
                        var dataInicial = $("#txtDataInicial").datepicker('getDate');
                        if (dataInicial != null && dataFinal != null) {
                            var timeDiff = Math.abs(dataFinal.getTime() - dataInicial.getTime());
                            var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
                            document.getElementById("<%= txtDiffDias.ClientID %>").value = diffDays;

                    } else {
                        document.getElementById("<%= txtDiffDias.ClientID %>").value = "";
                    }

                }
                });
            });

            function formatarData(data) {
                dia = data.getDate();
                mes = data.getMonth() + 1;
                ano = data.getFullYear();
                if (dia < 10)
                    dia = "0" + dia;
                if (mes < 10)
                    mes = "0" + mes;
                return dia + "/" + mes + "/" + ano;
            }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>
                <asp:Label runat="server">Data Inicial:</asp:Label>
                <asp:TextBox ID="txtDataInicial" runat="server" ReadOnly="true"></asp:TextBox>
            </p>
            <p>
                <asp:Label runat="server">Data Final:</asp:Label>
                <asp:TextBox ID="txtDataFinal" runat="server" ReadOnly="true"></asp:TextBox>
            </p>
             <p>
                <asp:Label runat="server">Diferenca em dias:</asp:Label>
                <asp:TextBox ID="txtDiffDias" runat="server"></asp:TextBox>
            </p>
        </div>
    </form>
</body>


</html>
