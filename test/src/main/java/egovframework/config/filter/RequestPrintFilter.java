package egovframework.config.filter;

import java.io.IOException;
import java.util.Collection;
import java.util.Enumeration;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.Executor;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.util.ContentCachingResponseWrapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class RequestPrintFilter extends OncePerRequestFilter {

	private final Executor executor;
	
	public RequestPrintFilter(Executor executor) {
		
		this.executor = executor;
	}
	
	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
        
		CustomHttpServletRequestWrapper requestWrapper = new CustomHttpServletRequestWrapper(request, executor);
		ContentCachingResponseWrapper responseWrapper = new ContentCachingResponseWrapper(response);
		
		printRequest(requestWrapper);
		
		filterChain.doFilter(requestWrapper, responseWrapper);
		
		printResponse(responseWrapper);
	}

	/**
	 * 서버에 접근하는 사용자의 정보를 콘솔에 출력.
	 */
	private void printRequest(CustomHttpServletRequestWrapper request) {
		
		String requestURI = request.getRequestURI();
		String remoteAddr = request.getRemoteAddr();
		String sessionId = request.getRequestedSessionId();
		String method = request.getMethod();
		//String requestHeader = getRequestHeader(request);
		String requestBody = readRequest(request);
		String principal = "";
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		if (authentication instanceof UsernamePasswordAuthenticationToken) 
			{ principal = ((User) authentication.getPrincipal()).toString(); } 
		
		else if (authentication instanceof AnonymousAuthenticationToken) 
			{ principal = (String) authentication.getPrincipal(); }
		
		log.debug("<= [\"{}\", \"{}\", \"{}\"], [({}) \"{}\", body: {}]", remoteAddr, sessionId, principal, method, requestURI, requestBody);
	}
	
	private void printResponse(ContentCachingResponseWrapper responseWrapper) throws IOException {
		
		//String header = getResponseHeader(responseWrapper);
		String contentType = responseWrapper.getContentType();
		String content = "<생략>";
		
		if (contentType != null) {
			
			switch (contentType) {
			
				case "text/html":
					break;
					
				case "application/json":
					content = new String(responseWrapper.getContentAsByteArray(), "UTF-8");
					break;
	
				default:
					break;
			}
		}
		
		//log.debug("=> header: [{}], contentType: {}, content: [{}]", header, contentType, content);
		log.debug("=> contentType: {}, content: [{}]", contentType, content);
		
		responseWrapper.copyBodyToResponse();
	}

	private String readRequest(CustomHttpServletRequestWrapper request) {
		
		String method = request.getMethod();
		String requestData = readParameters(request);
		
		if (!"GET".equals(method)) {
			
			if (request.getContentType().toLowerCase().contains("json")) {
				
				requestData = new String(request.getRequestData());
			} 
		}
		
		return requestData;
	}
	
    private String readParameters(HttpServletRequest request) {
    	
        Enumeration<String> parameterNames = request.getParameterNames();
        Map<String, Object> parameterMap = new LinkedHashMap<String, Object>();
        
        while (parameterNames.hasMoreElements()) {
        	
            String parameterName = parameterNames.nextElement();
            String parameterValue = request.getParameter(parameterName);
            
            parameterMap.put(parameterName, parameterValue);
        }
		
    	return parameterMap.toString();
    }
    
    private String getRequestHeader(HttpServletRequest request) {
    	
    	Enumeration<String> headerNames = request.getHeaderNames();
		
		StringBuilder headerStringBuilder = new StringBuilder();
		
		while (headerNames.hasMoreElements()) {
			
			String headerName = headerNames.nextElement();
			String header = request.getHeader(headerName);
			
			headerStringBuilder.append(headerName);
			headerStringBuilder.append(": ");
			headerStringBuilder.append(header);
			headerStringBuilder.append(", ");
		}
		
		if (headerStringBuilder.length() >= 2)
			headerStringBuilder.setLength(headerStringBuilder.length() - 2);
		
		return headerStringBuilder.toString();
    }
    
    private String getResponseHeader(ContentCachingResponseWrapper response) {
    	
    	Collection<String> headerNames = response.getHeaderNames();
    	
    	StringBuilder headerStringBuilder = new StringBuilder();
    	
    	for (String headerName : headerNames) {
    		
    		String header = response.getHeader(headerName);
    		
    		headerStringBuilder.append(headerName);
    		headerStringBuilder.append(": ");
    		headerStringBuilder.append(header);
    		headerStringBuilder.append(", ");
    	}
    	
    	if (headerStringBuilder.length() >= 2)
    		headerStringBuilder.setLength(headerStringBuilder.length() - 2);
    	
    	return headerStringBuilder.toString();
    }
}
