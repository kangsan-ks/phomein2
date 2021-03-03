package com.main.uploadfile.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.main.cmmn.vo.S3UploadResult;

@Component
public class FileUploader {
    //이미지 업로드 API URL
    private static String s3FreestyleImageUploadUrl = "http://web-upload.joycityglobal.com/freestyle/image/upload.json";

    public static S3UploadResult uploadBoardImage(@RequestParam String type, @RequestParam MultipartFile file) throws IllegalStateException, IOException {
        if (file.getSize() == 0) {
            return null;
        }

        //MultipartFile 형식 File로 변환
        File f = multipartToFile(file);

        CloseableHttpClient httpclient = HttpClients.createDefault();

        try {
            HttpPost httppost = new HttpPost(s3FreestyleImageUploadUrl);

            FileBody bin = new FileBody(f);
            StringBody typePart = new StringBody(type, ContentType.TEXT_PLAIN);

            //file(파일객체), type(이미지 저장 Path)을 Parameter로 HTTP 통신
            HttpEntity reqEntity = MultipartEntityBuilder.create().addPart("file", bin).addPart("type", typePart).build();
            httppost.setEntity(reqEntity);

            CloseableHttpResponse response = httpclient.execute(httppost);
            try {
                HttpEntity resEntity = response.getEntity();
                BufferedReader rd = new BufferedReader(new InputStreamReader(resEntity.getContent()));

                String line = "";
                StringBuffer buffer = new StringBuffer();
                while ((line = rd.readLine()) != null) {
                    buffer.append(line);
                }
                EntityUtils.consume(resEntity);

                //파일 업로드 Return Value
                String result = buffer.toString();

                return new Gson().fromJson(result, S3UploadResult.class);
            } finally {
                response.close();
            }
        } finally {
            httpclient.close();
        }
    }

    private static File multipartToFile(MultipartFile multipart) throws IllegalStateException, IOException {
        File tmpFile = new File(System.getProperty("java.io.tmpdir") + System.getProperty("file.separator") + multipart.getOriginalFilename());
        multipart.transferTo(tmpFile);
        return tmpFile;
    }
}
