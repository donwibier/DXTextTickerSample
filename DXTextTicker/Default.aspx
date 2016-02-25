<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DXTextTicker.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        div.footer{
             text-align: center;
        }
        div.centre
        {
          text-align: left;
        
          display: block;
          margin-left: auto;
          margin-right: auto;
        }

        .text-ticker-text{
            font-size: 14px;
            height: 40px;
            overflow: hidden;
            position: relative;
            color: #ff6a00;
            padding: 17px 17px 0 17px;
        }

        .dxisControl > .dxis-passePartout{ 
            background-color: azure; 
            border-radius: 5px 5px 5px 5px;
        }
        
        .text-ticker-text a,
        .text-ticker-text a:hover {
            color:#4800ff;
        }
        .text-ticker .dxis-nbDotsBottom {
            display:none;
        }

        
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <dx:ASPxPanel ID="headerPanel" runat="server" Width="100%" FixedPosition="WindowTop">
            <PanelCollection>
                <dx:PanelContent runat="server">
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxPanel>
        <!-- content -->
        <dx:ASPxPanel ID="footerPanel" runat="server" Width="100%" FixedPosition="WindowBottom" CssClass="footer">


            <PanelCollection>
                <dx:PanelContent runat="server">
                    <dx:ASPxPanel runat="server" Width="960px" CssClass="centre">

                        <PanelCollection>
                            <dx:PanelContent runat="server">

                                <dx:ASPxImageSlider runat="server" ID="slider" Width="100%" 
                                    EnableTheming="false" EnableViewState="false" 
                                    Height="50px" CssClass="text-ticker" DataSourceID="DSNews" ImageUrlField="ImageUrl">
                                    <SettingsImageArea ImageSizeMode="ActualSizeOrFit" 
                                        NavigationButtonVisibility="None"
                                        EnableLoopNavigation="true" AnimationDuration="2000" ItemTextVisibility="None" ShowItemText="False" />
                                    <SettingsNavigationBar Mode="Dots" ThumbnailsModeNavigationButtonVisibility="None" />
                                    <SettingsSlideShow AutoPlay="true" 
                                        StopPlayingWhenPaging="false" 
                                        PausePlayingWhenMouseOver="false" 
                                        PlayPauseButtonVisibility="None" Interval="3000"></SettingsSlideShow>
                                    
                                    <ItemTemplate>
                                        <div class="text-ticker-text">
                                            <b><%# Container.EvalDataItem("Title") %></b>&nbsp; 
                                            <a href='<%# Container.EvalDataItem("Url") %>'><%# Container.EvalDataItem("Text") %></a>
                                        </div>
                                    </ItemTemplate>
                                </dx:ASPxImageSlider>

                            </dx:PanelContent>
                        </PanelCollection>

                    </dx:ASPxPanel>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxPanel>

        <asp:XmlDataSource ID="DSNews" runat="server" DataFile="~/App_Data/NewsFeed.xml" XPath="//items/*"></asp:XmlDataSource>

    </form>
</body>
</html>
