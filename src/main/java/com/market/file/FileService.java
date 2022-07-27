package com.market.file;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FileService {

	@Autowired
	private FileDAO dao;
	
	public void deleteFiles(String path) throws Exception{
		
		List<String> files_db =dao.selectSys_name();
		File[] files_root= new File(path).listFiles();
		if(files_db.size() != 0 && files_root.length!=0) {
			for(File f: files_root) {
				if(!files_db.contains(f.getName())) {
					System.out.println(f.getName()+ "삭제할 파일");
					f.delete();
				}
				
			}
		}
		System.out.println("file_root.length: "+ files_root.length);
		for(File f : files_root) {
			System.out.println(f.getName());
		}

	}
}
