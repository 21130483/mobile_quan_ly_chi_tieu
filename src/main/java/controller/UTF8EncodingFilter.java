package controller;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter({ "/html/*", "/ProductSuggestionService", "/UserAdmin" })
public class UTF8EncodingFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        // Set the character encoding to UTF-8 for responses
//        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Continue with the filter chain
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
