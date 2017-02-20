package com.web.common.file.action;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.awt.image.DataBufferByte;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.commontemplate.util.coder.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pub.functions.StrFuncs;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import com.sys.service.TempVerifycodeService;

/**
 * Created by IntelliJ IDEA. User: dgs
 * Date: 2009-1-8 Time: 18:02:34
 */
@Controller("/file/verifyimage.do")
public class VerifyimageAction {

	private static char[] options = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
	
	@RequestMapping
	public void execute(HttpServletRequest request, HttpServletResponse response, String key) throws Exception {
		
		char[] value = new char[4];
		for (int i = 0; i < value.length; i++){
			int index = (int)(Math.random() * 100) % options.length;
			value[i] = options[index];
		}
		
		if(StrFuncs.isEmpty(key)){
			key = MD5.encode(request.getSession().getId());
		}
		
		tempVerifycodeService.create(request.getSession().getId(), String.valueOf(value));
		
		createImg(value, response);
	}

	private void createImg(char[] value, HttpServletResponse response) throws Exception{
		int width = 20 * value.length;
		int height = 30;
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

		Graphics g = image.getGraphics();

		g.setColor(getRadomColor(200, 250));
		g.fillRect(0, 0, width, height);

		g.setFont(new Font("Arial", Font.BOLD, 24));

		for (int i = 0; i < 155; i++){
			g.setColor(getRadomColor(120,200));
			int x = (int)(Math.random() * width);
			int y = (int)(Math.random() * height);
		    int x1 = x + 20 - (int)(Math.random() * 40);
		    int y1 = y + 20 - (int)(Math.random() * 40);
			g.drawLine(x, y, x1, y1);
		}

		// 取随机产生的认证码(4位数字)
		for (int i = 0; i < value.length; i++){
		    // 将认证码显示到图象中 
		    g.setColor(getRadomColor());//调用函数出来的颜色相同，可能是因为种子太接近，所以只能直接生成
		    int x = 10 + 13 * i + (int)(Math.random() * 5);
		    int y = 20 + (int)(Math.random() * 5);
		    g.drawString(String.valueOf(value[i]), x, y);
		}
		
		// 图象生效
		g.dispose();
		//后续再考虑旋转

		// 输出图象到页面
		//JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(response.getOutputStream());
		//encoder.encode(image);
		//ImageOutputStream imageOutputStream = ImageIO.createImageOutputStream(response.getOutputStream());
		
		//imageOutputStream.write(image,"JPEG",response.getOutputStream());
		
		//byte[] data = ((DataBufferByte) image.getData().getDataBuffer()).getData();
		//imageOutputStream.write(data);
		ImageIO.write(image,"JPEG",response.getOutputStream());
	}
	
	private Color getRadomColor(int min, int max){//给定范围获得随机颜色
		int r = min + (int)(Math.random() * (max - min));
		int g = min + (int)(Math.random() * (max - min));
		int b = min + (int)(Math.random() * (max - min));
        return new Color(r, g, b);
	}
	
	//给定范围获得随机颜色，基色为红、绿、蓝 三个纯度高的颜色，在此基础上进行小范围调整
	private Color getRadomColor(){
		int[][] rgps = new int[][]{{255,0,0}, {0, 128, 0}, {0, 0, 255}};
		int index = (int)(Math.random() * 10) % rgps.length;
		int[] rgp = rgps[index];
		
        return new Color(getRandomRgp(rgp[0]), rgp[1], rgp[2]);
	}
	
	private int getRandomRgp(int value){
		if(value >= 235){
			return value - (int)(20 * Math.random());
		}
		else if(value <= 20){
			return value + (int)(20 * Math.random());
		}
		else{
			return value + 20 - (int)(40 * Math.random());
		}
	}
	
	@Autowired
	private TempVerifycodeService tempVerifycodeService;
}
