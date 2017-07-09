Public Class FormViewDemo
    Inherits System.Web.UI.Page

    Dim _context As BooksEntities

    Public Sub New()
        _context = New BooksEntities()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            BindFormView()
        End If
    End Sub

    Private Sub BindFormView()
        Dim bookRecords = _context.BookDetails.ToList()
        FormViewBookDetails.DataSource = bookRecords
        FormViewBookDetails.DataBind()
    End Sub

    Protected Sub FormViewBookDetails_ItemUpdating(sender As Object, e As FormViewUpdateEventArgs)
        Dim id As Integer = Int32.Parse(FormViewBookDetails.DataKey(0).ToString())
        Dim result = _context.BookDetails.Find(id)
        If result IsNot Nothing Then
            Dim item = New BookDetail()
            item.BookSerialNo = id
            item.BookISBN = DirectCast(FormViewBookDetails.FindControl("txtBookISBN"), TextBox).Text
            item.BookTitle = DirectCast(FormViewBookDetails.FindControl("txtBookTitle"), TextBox).Text
            item.BookAuthor = DirectCast(FormViewBookDetails.FindControl("txtBookAuthor"), TextBox).Text
            item.BookPublisher = DirectCast(FormViewBookDetails.FindControl("txtBookPublisher"), TextBox).Text
            item.BookCategory = DirectCast(FormViewBookDetails.FindControl("txtBookCategory"), TextBox).Text
            _context.Entry(result).CurrentValues.SetValues(item)
            _context.SaveChanges()
            ResetBinding()
        End If
    End Sub

    Protected Sub FormViewBookDetails_PageIndexChanging(sender As Object, e As FormViewPageEventArgs)
        FormViewBookDetails.PageIndex = e.NewPageIndex
        BindFormView()
    End Sub

    Protected Sub FormViewBookDetails_ItemCommand(sender As Object, e As FormViewCommandEventArgs)
        If e.CommandName = "Cancel" Then
            FormViewBookDetails.ChangeMode(FormViewMode.ReadOnly)
        ElseIf e.CommandName = "Edit" Then
            FormViewBookDetails.ChangeMode(FormViewMode.Edit)
        ElseIf e.CommandName = "New" Then
            FormViewBookDetails.ChangeMode(FormViewMode.Insert)
        ElseIf e.CommandName = "Delete" Then
            FormViewBookDetails.ChangeMode(FormViewMode.ReadOnly)
            BindFormView()
        End If
    End Sub

    Protected Sub FormViewBookDetails_ModeChanging(sender As Object, e As FormViewModeEventArgs)
        If e.NewMode = FormViewMode.Insert Then
            FormViewBookDetails.AllowPaging = False
        ElseIf e.NewMode = FormViewMode.Edit Then
            FormViewBookDetails.AllowPaging = False
            BindFormView()
        Else
            FormViewBookDetails.AllowPaging = True
            BindFormView()
        End If
    End Sub

    Protected Sub FormViewBookDetails_ItemInserting(sender As Object, e As FormViewInsertEventArgs)
        Dim item = New BookDetail()
        item.BookISBN = DirectCast(FormViewBookDetails.FindControl("txtInsertBookISBN"), TextBox).Text
        item.BookTitle = DirectCast(FormViewBookDetails.FindControl("txtInsertBookTitle"), TextBox).Text
        item.BookAuthor = DirectCast(FormViewBookDetails.FindControl("txtInsertBookAuthor"), TextBox).Text
        item.BookPublisher = DirectCast(FormViewBookDetails.FindControl("txtInsertBookPublisher"), TextBox).Text
        item.BookCategory = DirectCast(FormViewBookDetails.FindControl("txtInsertBookCategory"), TextBox).Text
        _context.BookDetails.Add(item)
        _context.SaveChanges()
        ResetBinding()
    End Sub

    Protected Sub FormViewBookDetails_ItemDeleting(sender As Object, e As FormViewDeleteEventArgs)
        If FormViewBookDetails.DataKey(0) IsNot Nothing Then
            Dim id = Int32.Parse(FormViewBookDetails.DataKey(0).ToString())
            Dim itemDelete = _context.BookDetails.FirstOrDefault(Function(t) t.BookSerialNo = id)
            If itemDelete IsNot Nothing Then
                _context.Entry(itemDelete).State = EntityState.Deleted
                _context.SaveChanges()
                ResetBinding()
            End If
        End If
    End Sub

    Private Sub ResetBinding()
        FormViewBookDetails.ChangeMode(FormViewMode.ReadOnly)
        FormViewBookDetails.AllowPaging = True
        BindFormView()
    End Sub
End Class