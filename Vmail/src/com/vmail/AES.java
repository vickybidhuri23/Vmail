package com.vmail;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.Base64;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet("/AES")
public class AES extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
		private static SecretKeySpec secretKey ;
	    private static byte[] key ;
	    
	    private static String encryptedString;
	    private static String decryptedString;
	    
	    
	    public static String getNonce() {       						//   Generating NONCE  
	        byte[] bytes = new byte[32];
	        String nonce = null;
	        try {
	            SecureRandom sr = SecureRandom.getInstanceStrong();
	            sr.nextBytes(bytes);
	            nonce = Base64.getEncoder().encodeToString(bytes);
	            }
	        catch (NoSuchAlgorithmException nsae) {
	            System.err.println(nsae);
	        }
	        return nonce;
	    }
	    
	    
	    public static void setKey(String myKey){
	    		try {
				key = myKey.getBytes("UTF-8");
				key = Arrays.copyOf(key, 32);      						// use only first 256 bit
	            secretKey = new SecretKeySpec(key, "AES");
			    
	    		} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
				}
	        }
	    
	    public static String encrypt(String strToEncrypt) {             // AES Encryption function
	    	try {
	    		Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
	            cipher.init(Cipher.ENCRYPT_MODE, secretKey);
	            encryptedString = Base64.getEncoder().encodeToString(cipher.doFinal(strToEncrypt.getBytes("UTF-8")));
	            }
	    	catch (UnsupportedEncodingException | InvalidKeyException | NoSuchAlgorithmException | BadPaddingException | IllegalBlockSizeException | NoSuchPaddingException e) {
	            System.out.println("Error while encrypting: "+e.toString());
	    		}
	    	return encryptedString;
	    }

	    public static String decrypt(String strToDecrypt) {       		// AES Decryption function
	    	try {
	    		Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
	            cipher.init(Cipher.DECRYPT_MODE, secretKey);
	            decryptedString = new String(cipher.doFinal(Base64.getDecoder().decode(strToDecrypt)));
	            }
	        catch (InvalidKeyException | NoSuchAlgorithmException | BadPaddingException | IllegalBlockSizeException | NoSuchPaddingException e){
	            System.out.println("Error while decrypting: " +e.toString());
	        }
	        return decryptedString;
	    }
}