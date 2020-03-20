package at.fhj.ima.guestbook

import javax.servlet.annotation.WebServlet
import javax.servlet.http.HttpServlet
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

@WebServlet("/book")
class GuestBookController : HttpServlet() {

    override fun doPost(req: HttpServletRequest, resp: HttpServletResponse) {
        val guestBookManagerCtx = servletContext.getAttribute("book") as? GuestBookManager ?:
                GuestBookManager()
        val guestBookManagerSession = req.getSession(true).getAttribute("book") as? GuestBookManager ?:
                GuestBookManager()
        servletContext.setAttribute("book", guestBookManagerCtx)
        req.session.setAttribute("book", guestBookManagerSession)
        val name = req.getParameter("name")
        val comment = req.getParameter("comment")
        if (!name.isNullOrEmpty() and !comment.isNullOrEmpty())
        {
            val newEntry = GuestBookEntry(name, comment)
            guestBookManagerCtx.add(newEntry)
            guestBookManagerSession.add(newEntry)
        }
        doGet(req, resp)
    }

    override fun doGet(req: HttpServletRequest, resp: HttpServletResponse) {
     req.getRequestDispatcher("/show.jsp").forward(req, resp)
    }
}