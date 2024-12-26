## **Project Overview**

This **Julia-based** project explores key text statistics, such as **total and unique word counts** and **average word length**. The objective is to assess the efficiency of different data structures for text representation, specifically comparing **string arrays** and **prefix trees**.

---

## **Data & Statistics**

Two texts were selected for analysis:

- **The Little Prince** by **Antoine de Saint-Exupéry**
  - Total Words: **36,280**
  - Distinct Words: **5,482**

- **Cyrano de Bergerac** by **Edmond Rostand**
  - Total Words: **15,424**
  - Distinct Words: **2,401**

---

## **Key Outcomes**

The results were consistent with expectations:

- **Array Complexity**: O(n) for all cases, where *n* represents the number of distinct words.
- **Tree Complexity**: O(n) only in the worst-case scenario, where *n* is the number of distinct words.  
  - **Worst-case scenario**: The tree stores completely unique words with no shared prefixes, effectively resembling a linked list of word characters. Each shared prefix between words increases the tree's efficiency.

---

## **Challenges & Limitations**

- **Word Segmentation**:  
  One challenge faced was segmenting words correctly. To handle this, a list of **23 word separators** was iteratively developed based on the selected texts. However, this list may not be exhaustive, and segmentation issues could arise if applied to other texts.
















