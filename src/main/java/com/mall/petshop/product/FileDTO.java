package com.mall.petshop.product;

import lombok.Data;

@Data
public class FileDTO {

    private String uuid;
    private String fileName;
    private String contentType;

    public FileDTO(String originalFilename, String contentType) {
        this.uuid = uuid;
        this.fileName = fileName;
        this.contentType = contentType;
    }
}
