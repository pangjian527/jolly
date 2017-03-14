package com.web.utils;

import java.awt.Image;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.awt.image.CropImageFilter;
import java.awt.image.FilteredImageSource;
import java.awt.image.ImageFilter;
import java.io.ByteArrayInputStream;
import java.io.FileOutputStream;

import javax.imageio.ImageIO;
/*
 * 图片处理
 * by dgs
 * */
public class ImageHelper {
	
	/*
	 * 根据尺寸图片居中裁剪
	 * 目前支持：100x100  280x280  160x120  400x300  400*225种
	 */
	public static void cutCenterImage2(byte[] content,String dest,int w,int h) throws Exception{
        BufferedImage bi = ImageIO.read(new ByteArrayInputStream(content));
         /* 原始图像的宽度和高度 */  
        int rh = bi.getHeight(); 
        int rw = bi.getWidth();  
              
        //剪切图片右上角坐标
        int x = 0;
        int y = 0;
        //剪切的宽与高度
        int cw = w;
        int ch = h;
        
        if((rh*1.0/rw) > (h*1.0/w)){
        	if(rh>h){
        		y = (rh - (int)(rw * h *1.0/ w ))/2;
        		cw = rw;
        		ch = rh-2*y;
        	}
        }else if((rh*1.0/rw) < (h*1.0/ w)){
        	if(rw>w){
        		x = (rw - (int)(rh * w *1.0/ h ))/2;
        		cw = rw-2*x;
        		ch = rh;
        	}
        }else if((rh*1.0/rw) == (h*1.0/ w)){
        	cw = rw;
        	ch = rh;
        }
        if(cw>w || ch>h){//如果是大了，那么就要压缩
        	bi = zoomImage(bi, cw, ch,x,y, w*1.0/cw);
        }
       // try {
        /*输出到文件流*/
        
        String suffix = ImageHelper.getSuffix(dest);
        
        FileOutputStream newimage = new FileOutputStream(dest);
        ImageIO.write(bi, suffix, newimage);
        newimage.close();
        
//        JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(newimage);
//        JPEGEncodeParam jep = JPEGCodec.getDefaultJPEGEncodeParam(bi);
        
        /* 压缩质量 */
//        jep.setQuality(0.9f, true);
//        encoder.encode(bi, jep);
       /*近JPEG编码*/
            
        /*File file = new File(dest);
		OutputStream os = new BufferedOutputStream(new FileOutputStream(file));
		os.write(content);
		os.close();*/
      /*  } catch (Exception e) {
        	e.printStackTrace();
        }*/
       // ImageIO.write(bi, "jpg", new File(dest)); 
       // System.out.println("居中裁剪");
        //1.获取原始图片的长(rh)、宽(rw)
        //2.如果 (rh/rw) > h / w，说明原图过高，需要从顶部、底部切除一部分。顶部、顶部切除的数量为 (rh - rw * h / w )/2 px
        //3.如果 (rh/rw) < h / w，说明原图过宽，需要从左、右切除一部分。左右各切除的数量为 (rw - rh * w / h )/2 px
        //4.如果 (rh/rw) = h / w，不用切
        //5.按照切割后的图片大小，按比例压缩到 w,h的大小
	}
	
	//获得文件的后缀名
	public static String getSuffix(String filename){
		String suffix = ".jpg";
		if(filename!=null && filename.contains(".")){
			suffix = filename.substring(filename.lastIndexOf(".")+1, filename.length());
		}
		return suffix;
	}
	
	
	/*
     * 图片剪切与缩放
     */
    private static BufferedImage zoomImage(BufferedImage bufImg,int w,int h,int x,int y,double scale){    
    	//剪切
    	Image image = null;
    	if(x>0 || y>0){
    		ImageFilter filter = new CropImageFilter(x, y, w, h);  
            image = Toolkit.getDefaultToolkit().createImage(new FilteredImageSource(bufImg.getSource(), filter));
    	}
    	w = (int)(w*scale);
    	h = (int)(h*scale);
    	BufferedImage bufferedImage = new BufferedImage(w, h,BufferedImage.TYPE_INT_RGB);    	
    	if(image==null){
    		bufferedImage.getGraphics().drawImage(bufImg.getScaledInstance(w, h,java.awt.Image.SCALE_SMOOTH), 0, 0, null);	
    	}else{
    		bufferedImage.getGraphics().drawImage(image.getScaledInstance(w, h,java.awt.Image.SCALE_SMOOTH), 0, 0, null);	
    	}
		return bufferedImage;
	}	
	
}
