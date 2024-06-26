package com.DAO;

import java.util.List;

import com.entity.ClothDtls;

public interface ClothDAO {
    public boolean addCloth(ClothDtls c);
    public List<ClothDtls> getAllClothes();
    public ClothDtls getClothById (int id);
    public boolean updateEditCloth(ClothDtls c);
    public boolean deleteCloth(int id);
    public List<ClothDtls> getNewCloth();
    public List<ClothDtls> getTrendingCloth();
    public List<ClothDtls> getOldCloth();
    public List<ClothDtls> getAllTrendingClothes();
    public List<ClothDtls> getAllNewClothes();
    public List<ClothDtls> getAllOldClothes();
    public List<ClothDtls> getClothByOld(String email, String category);
    public boolean oldClothDelete(String email, String category, int clothId);
    public List<ClothDtls> getClothBySearch(String ch);
    
    
}
