package egovframework.config.filter;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.concurrent.Executor;

import javax.servlet.ReadListener;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.springframework.util.StreamUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomHttpServletRequestWrapper extends HttpServletRequestWrapper {

	private final Executor executor;
	private final byte[] requestData;

	public CustomHttpServletRequestWrapper(HttpServletRequest request, Executor executor) throws IOException {

		super(request);
		
		this.requestData = StreamUtils.copyToByteArray(request.getInputStream());
		this.executor = executor;
	}

	@Override
	public ServletInputStream getInputStream() {
		
		ByteArrayInputStream inputStream = new ByteArrayInputStream(requestData);
		
		return new ServletInputStream() {

			@Override
			public int read() {
				
				return inputStream.read();
			}

			@Override
			public boolean isFinished() {
				
				return inputStream.available() == 0;
			}

			@Override
			public boolean isReady() {
				
				return true;
			}

			@Override
			public void setReadListener(ReadListener readListener) {
				
                executor.execute(() -> {
                	
                    try {
                    	
                        while (inputStream.available() > 0) { readListener.onDataAvailable(); }
                        
                        readListener.onAllDataRead();
                        
                    } catch (IOException e) {
                    	
                    	log.error("에러 발생");
                        readListener.onError(e);
                    }
                });
			}
		};
	}

	@Override
	public BufferedReader getReader() {
		
		return new BufferedReader(new InputStreamReader(getInputStream()));
	}
	
	public byte[] getRequestData() {
		
		return requestData;
	}
}
