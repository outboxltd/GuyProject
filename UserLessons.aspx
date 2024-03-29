﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserLessons.aspx.cs" Inherits="GuyProject.UserLessons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #LabelFirstMessage {
            direction: rtl;
            float: right;
        }

        #DropDownListTeachers {
            text-align: center;
            display: inline-block;
            float: right;
        }

        #DropDownListStudents {
            text-align: center;
            display: inline-block;
            float: right;
        }

        #separate {
            border: 1px solid black;
            margin: 20px 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <h1>UserLessons</h1>
    <br />
    <br />
    <center>
        <h2>כאן תוכל לראות את כל השיעורים שנקבעו לך</h2>
        <h6>חשוב להדגיש: כי אורך כל שיעור הוא כשעה אחת בלבד</h6>
        <asp:DropDownList ID="DropDownListTeachers" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListTeachers_SelectedIndexChanged">
        </asp:DropDownList>
        <br />
        <br />
        <asp:DropDownList ID="DropDownListStudents" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListStudents_SelectedIndexChanged"></asp:DropDownList>
        <br />
        <br />
        <asp:DropDownList ID="DropDownListPaymentStatus" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListPaymentStatus_SelectedIndexChanged">
            <asp:ListItem>בחר סטטוס</asp:ListItem>
            <asp:ListItem>שולם</asp:ListItem>
            <asp:ListItem>לא שולם</asp:ListItem>
        </asp:DropDownList>
        <asp:GridView ID="GridViewShowLessons" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GridViewShowLessons_RowDeleting" OnRowCommand="GridViewShowLessons_RowCommand">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField HeaderText="סטטוס תשלום" DataField="PaymentStatus" ReadOnly="True" />
                <asp:BoundField HeaderText="מחיר השיעור" DataField="Price" ReadOnly="True" />
                <asp:BoundField DataField="SubjectName" HeaderText="מקצוע לימוד" ReadOnly="True" />
                <asp:BoundField HeaderText="מקום השיעור" DataField="Address" ReadOnly="True" />
                <asp:BoundField HeaderText="מספר טלפון תלמיד" DataField="StudentPhone" ReadOnly="True" />
                <asp:BoundField HeaderText="שם התלמיד" DataField="StudentName" ReadOnly="True" />
                <asp:BoundField HeaderText="מספר טלפון מורה" DataField="TeacherPhone" ReadOnly="True" />
                <asp:BoundField HeaderText="שם המורה" DataField="TeacherName" ReadOnly="True" />
                <asp:BoundField HeaderText="שעת תחילת השיעור" DataFormatString="{0:hh:mm tt}" DataField="StartHour" ReadOnly="True" />
                <asp:BoundField HeaderText="תאריך השיעור" DataFormatString="{0:d}" DataField="LessonDate" ReadOnly="True" />
                <asp:CommandField ButtonType="Button" DeleteText="מחק" ShowCancelButton="False" ShowDeleteButton="True" />
                <asp:ButtonField ButtonType="Button" CommandName="Pay" Text="שלם על השיעור" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <br />
        <asp:Label ID="LabelDeleteMessage" Text="text" runat="server" Height="30px" Width="150px" />
        <br />

        <h6>אלה השיעורים בתור מורה תוכל להזין שקיבלת תשלום במזומן</h6>
        <asp:DropDownList ID="DropDownListTeacherPamentStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownListTeacherPamentStatus_SelectedIndexChanged">
            <asp:ListItem>בחר סטטוס</asp:ListItem>
            <asp:ListItem>שולם</asp:ListItem>
            <asp:ListItem>לא שולם</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:GridView ID="GridViewTeacherLessons" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="GridViewTeacherLessons_RowCancelingEdit" OnRowEditing="GridViewTeacherLessons_RowEditing" OnRowUpdating="GridViewTeacherLessons_RowUpdating">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="סטטוס תשלום">
                    <ItemTemplate>
                        <asp:Label ID="LabelStatusPayment" runat="server" Text='<%# Eval("PaymentStatus") %>' Visible='<%# !GridViewShowLessons.EditIndex.Equals(Container.DataItemIndex) %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownListPaymentStatus" runat="server" AutoPostBack="true" SelectedValue='<%# Eval("PaymentStatus") %>'>
                            <asp:ListItem Value="לא שולם">לא שולם</asp:ListItem>
                            <asp:ListItem Value="שולם">שולם</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:BoundField HeaderText="מחיר השיעור" DataField="Price" ReadOnly="True" />
                <asp:BoundField DataField="SubjectName" HeaderText="מקצוע לימוד" ReadOnly="True" />
                <asp:BoundField HeaderText="מקום השיעור" DataField="Address" ReadOnly="True" />
                <asp:BoundField HeaderText="מספר טלפון תלמיד" DataField="StudentPhone" ReadOnly="True" />
                <asp:BoundField HeaderText="שם התלמיד" DataField="StudentName" ReadOnly="True" />
                <asp:BoundField HeaderText="מספר טלפון מורה" DataField="TeacherPhone" ReadOnly="True" />
                <asp:BoundField HeaderText="שם המורה" DataField="TeacherName" ReadOnly="True" />
                <asp:BoundField HeaderText="שעת תחילת השיעור" DataFormatString="{0:hh:mm tt}" DataField="StartHour" ReadOnly="True" />
                <asp:BoundField HeaderText="תאריך השיעור" DataFormatString="{0:d}" DataField="LessonDate" ReadOnly="True" />
                <asp:CommandField ButtonType="Button" CancelText="בטל" EditText="הכנס שקיבלת תשלום במזומן" InsertVisible="False" ShowEditButton="True" UpdateText="הכנס שקיבלת תשלום במזומן" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <br />
        <hr class="separate" />
        <br />
        <h2>השיעורים שבחרת לשלם עליהם</h2>
        <h6>כל השיעורים שמופיעים כאן מיועדים לתשלום</h6>
        <br />
        <asp:GridView ID="GridViewLessonstoPay" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" OnRowCommand="GridViewLessonstoPay_RowCommand">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField HeaderText="מחיר השיעור" DataField="Price" ReadOnly="True" />
                <asp:BoundField DataField="SubjectName" HeaderText="מקצוע לימוד" ReadOnly="True" />
                <asp:BoundField HeaderText="מקום השיעור" DataField="Address" ReadOnly="True" />
                <asp:BoundField HeaderText="מספר טלפון תלמיד" DataField="StudentPhone" ReadOnly="True" />
                <asp:BoundField HeaderText="שם התלמיד" DataField="StudentName" ReadOnly="True" />
                <asp:BoundField HeaderText="מספר טלפון מורה" DataField="TeacherPhone" ReadOnly="True" />
                <asp:BoundField HeaderText="שם המורה" DataField="TeacherName" ReadOnly="True" />
                <asp:BoundField HeaderText="שעת תחילת השיעור" DataFormatString="{0:hh:mm tt}" DataField="StartHour" ReadOnly="True" />
                <asp:BoundField HeaderText="תאריך השיעור" DataFormatString="{0:d}" DataField="LessonDate" ReadOnly="True" />
                <asp:ButtonField ButtonType="Button" CommandName="DeleteLessonToPay" Text="מחק שיעורים לתשלום" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:Label ID="LabelAddLessons" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Button ID="ButtonSubmitToPay" runat="server" OnClick="ButtonSubmitToPay_Click" Text="שלם על השיעורים" />
        <br />

    </center>
    <br />
</asp:Content>



