<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <title></title>
    <style>
        body {
            text-align: center;
        }

        #btnCopiar, #btnCopiarToken, #btnCopiarChavePublica, #btnCopiarSemente {
            font-size: 0.9rem;
            padding: 0rem 0.75rem;
        }

        .btn-success, .btn-warning {
            margin: 2vh 0vw 2vh 0vw;
        }

        .card {
            background-color: snow;
        }
    </style>
</head>
<body class="jumbotron">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h1>Paseto</h1>
                    <h2>Gerador e Autenticador</h2>
                    <h3>Paseto versão 2</h3>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-12">
                    <div class="row">
                        <div class="col-12">
                            <h4>Gerador de Chaves</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <label>Chave Privada (Semente):</label>
                            <div class="col-12 card">
                                <asp:Literal ID="chaveSementeGerada" runat="server"></asp:Literal>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <label>Chave Publica:</label>
                            <div class="col-12 card">
                                <asp:Literal ID="chavePublicaGerada" runat="server"></asp:Literal>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <asp:Button ID="btnGerarChave" runat="server" CssClass="btn btn-success" Text="Gerar Chaves" OnClick="btnGerarChave_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-12">
                    <div class="row">
                        <div class="col-12">
                            <h4>Gerador de Tokens</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <label>Chave Privada:</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <asp:Button ID="btnCopiarSemente" runat="server" CssClass="btn btn-info" Text="Importar Chave Privada" OnClick="btnCopiarSemente_Click" />
                                    </div>
                                </div>
                                <asp:TextBox ID="txtChavePrivada" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <label>Chave Pública:</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <asp:Button ID="btnCopiarChavePublica" runat="server" CssClass="btn btn-info" Text="Importar Chave Publica" OnClick="btnCopiarChavePublica_Click" />
                                    </div>
                                </div>
                                <asp:TextBox ID="txtChavePublica" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <asp:Button ID="btnGerarToken" runat="server" CssClass="btn btn-success" Text="Gerar Token" OnClick="btnGerarToken_Click" />
                        </div>
                    </div>
                    <asp:Panel ID="Panel1" runat="server">
                        <div class="row">
                            <div class="col-12 card">
                                <asp:Literal ID="ltrToken" runat="server"></asp:Literal>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-12">
                    <div class="row">
                        <div class="col-12">
                            <h4>Autenticador de Tokens</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <label>Chave Pública:</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <asp:Button ID="btnCopiar" runat="server" CssClass="btn btn-info" Text="Importar Chave Publica" OnClick="btnCopiar_Click" />
                                    </div>
                                </div>
                                <asp:TextBox ID="txtChavePublicaAut" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <label>Token:</label>

                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <asp:Button ID="btnCopiarToken" runat="server" CssClass="btn btn-info" Text="Importar Token Gerado" OnClick="btnCopiarToken_Click" />
                                    </div>
                                </div>
                                <asp:TextBox ID="txtToken" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <asp:Button ID="btnAutenticar" runat="server" CssClass="btn btn-warning" Text="Verificar/Autenticar Token" OnClick="btnAutenticar_Click" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <asp:Literal ID="ltrAut" runat="server"></asp:Literal>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <script src="Scripts/jquery-3.3.1.min.js"></script>
        <script src="Scripts/bootstrap.min.js"></script>
    </form>
</body>
</html>
