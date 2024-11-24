# Earthquake-phase-analysis
Analysis of seismic data using MATLAB filters for earthquake phases.
# Earthquake Phase Analysis Using MATLAB

## Introduction
This project uses MATLAB to analyze seismic data during earthquake phases: before, during, and after shocks. The aim is to gain insights into earthquake dynamics and improve response strategies.

## Methodology
1. **Data Collection:** Seismic data was collected from [source]. Preprocessing steps included noise reduction and outlier removal.
2. **Filter Design:**
   - Before shocks: Low-pass filters to identify precursor events.
   - During shocks: Band-pass filters to analyze dominant frequencies.
   - After shocks: High-pass filters to capture lingering effects.

## Results
### 1. Before Shocks
![Before Shocks](earthquake/before.png)
- Low-pass filtering revealed potential precursor events.

### 2. During Shocks
![During Shocks](earthquake/during.png)
- Band-pass filtering isolated dominant seismic frequencies.

### 3. After Shocks
![After Shocks](earthquake/after.png)
- High-pass filtering highlighted persistent effects.

## Project Files
- **Code:** MATLAB scripts in the `src/` directory.
- **Graphs:** Visualizations in the `graphs/` directory.
- **Data:** Processed seismic datasets in the `data/` directory.

## License
This project is licensed under the [MIT License](LICENSE).
