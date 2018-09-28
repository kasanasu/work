<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>冒険の始まり</title>
    <script src="Scripts/jquery-3.3.1.slim.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-3.3.1.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="StyleSheet1.css" rel="stylesheet" />
</head>
	<body class="pl-2 pt-3">
        <form id="form1" runat="server">
		    <table>
			    <tbody>
				    <tr><td>▼きみの名前を教えて！</td></tr>
				    <tr><td>
                        <div class="input-group col-lg-12">
					        <div class="input-group-prepend">
						        <span class="input-group-text">冒険者</span>
					        </div>
                            <asp:TextBox ID="Famiryname" class="form-control" runat="server" placeholder="Famiryname" aria-label="Famiryname"></asp:TextBox>
                            <asp:TextBox ID="Firstname"  class="form-control" runat="server" placeholder="Firstname" aria-label="Firstname"></asp:TextBox>
                        </div>
                    <tr><td>
                </tbody>
		    </table>
		    <br />
            <table>
			    <tbody>
				    <tr><td>▼冒険の相棒を決めよう！</td></tr>
				    <tr>
                        <td class="pl-3">
                            <asp:DropDownList ID="Dog" class="input-group-text" runat="server" >
                                <asp:ListItem>Choose...</asp:ListItem>
                                <asp:ListItem>シベリアンハスキー</asp:ListItem>
                                <asp:ListItem>アラスカンマラミュート</asp:ListItem>
                                <asp:ListItem>秋田犬</asp:ListItem>
                            </asp:DropDownList>
                        </td>
				    </tr>
                </tbody>
		    </table>
		    <br />
            <table>
			    <tbody>
				    <tr><td>▼最初の持ち物を決めよう！</td></tr>
				    <tr>
                        <td class="pl-3">
                            <asp:CheckBoxList ID="FirstBelongings" runat="server">
                                <asp:ListItem>モンスターボール</asp:ListItem>
                                <asp:ListItem>きずぐすり</asp:ListItem>
                                <asp:ListItem>ランニングシューズ</asp:ListItem>
                            </asp:CheckBoxList>
                        </td>
                    </tr>
				    
				    <tr />
				    <tr>
                        <td class="pl-2"><asp:Button ID="StartAdventure" class="btn btn-default" runat="server" Text="さあ冒険に出かけよう！！" OnClick="StartAdventure_Click" /></td>
                    </tr>
				    <tr />
				    <tr><td>
                        <div class="pl-2"><a href ="C:\01.Work\study\HTML\dogNext.html">シベリアンハスキーとは</a></div>
                    </td></tr>
			    </tbody>
		    </table>

            <div class="pl-2">
                <asp:Button ID="SearchFriends" class="btn btn-default" runat="server" Text="同じ相棒を選んだ友達を探す！" OnClick="SearchFriends_Click" />
            </div>
            <div class="table table-area">
	            <asp:ListView ID="ListView1" runat="server" GroupPlaceholderID="groupPlaceHolder1" ItemPlaceholderID="itemPlaceHolder1">
                    <EmptyDataTemplate>
			            <table>
				            <tr>
					            <th runat="server" class="name-field">
							        <label>Famiryname</label>
						        </th>
						        <th runat="server" class="name-field">
							        <label>Firstname</label>
						        </th>
						        <th runat="server">
							        <label>Dog</label>
						        </th>
						        <th runat="server">
							        <label>FirstBelongings</label>
						        </th>
				            </tr>
			            </table>
			            <p class="error-text">
				            データが存在しません。
			            </p>
		            </EmptyDataTemplate>
		            <LayoutTemplate>
			            <div class="header-area">
				            <table>
					            <tr>
						            <th runat="server" class="name-field">
							            <label>Famiryname</label>
						            </th>
						            <th runat="server" class="name-field">
							            <label>Firstname</label>
						            </th>
						            <th runat="server">
							            <label>Dog</label>
						            </th>
						            <th runat="server">
							            <label>FirstBelongings</label>
						            </th>
					            </tr>
						        <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
					        </table>
				        </div>
			        </LayoutTemplate>
			        <GroupTemplate>
				        <div class="data-area">
					        <tr>
					        <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
					        </tr>
				        </div>
			        </GroupTemplate>
			        <ItemTemplate>
				        <tr runat="server">
					        <td runat="server" class="name-field">
						        <asp:Label ID="lblFamName" runat="server" Text='<%# (Eval("famiry_name")) %>'></asp:Label>
					        </td>
					        <td runat="server" class="name-field">
						        <asp:Label ID="lblFstName" runat="server" Text='<%# (Eval("first_name")) %>'></asp:Label>
					        </td>
					        <td runat="server">
						        <asp:Label ID="lblDog" runat="server" Text='<%# (Eval("dog")) %>'></asp:Label>
					        </td>
					        <td runat="server">
						        <asp:Label ID="lblBelongings" runat="server"  Text='<%# (Eval("first_belongings")) %>'></asp:Label>
					        </td>
				        </tr>
			        </ItemTemplate>
		        </asp:ListView>
	        </div>
        </form>
    </body>
</html>
