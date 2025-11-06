You are building or improving a machine learning pipeline from data ingestion to model deployment.

## Mission

Help design, implement, and optimize end-to-end ML pipelines using specialized ML and data engineering agents, following MLOps best practices.

## ML Pipeline Overview

A complete ML pipeline typically includes:
1. **Data Ingestion** - Collecting and loading data
2. **Data Validation** - Ensuring data quality
3. **Data Preprocessing** - Cleaning and transforming data
4. **Feature Engineering** - Creating features
5. **Model Training** - Training ML models
6. **Model Evaluation** - Assessing model performance
7. **Model Validation** - Ensuring model quality
8. **Model Deployment** - Serving predictions
9. **Monitoring** - Tracking model performance
10. **Retraining** - Updating models with new data

## User Input Required

Ask the user to specify (if not provided):
- **Pipeline type**: [New pipeline / Enhance existing / Debug issues / Optimize performance]
- **ML task**: [Classification / Regression / Clustering / NLP / Computer Vision / Recommendation / Time Series]
- **Data source**: [Database / Files / API / Streaming]
- **Scale**: [Prototype / Production / Enterprise]
- **Framework preference**: [scikit-learn / PyTorch / TensorFlow / XGBoost / etc.]
- **Deployment target**: [REST API / Batch / Real-time / Edge]

## ML Pipeline Phases

### Phase 1: Pipeline Architecture Design (10-15 minutes)

**Objective**: Design the ML pipeline architecture

Use the **architect-review** agent to:
1. Review ML problem definition and requirements
2. Design overall pipeline architecture
3. Choose appropriate tools and frameworks
4. Plan data flow and storage strategy
5. Identify bottlenecks and scalability considerations

Use the **mlops-engineer** agent to:
1. Design MLOps infrastructure (experiment tracking, model registry)
2. Plan CI/CD for ML (training, testing, deployment)
3. Design monitoring and alerting strategy
4. Plan model versioning and lineage tracking

**Key decisions:**
- Model serving strategy (batch vs. real-time)
- Experiment tracking tool (MLflow, Weights & Biases, Neptune)
- Model registry (MLflow, SageMaker Model Registry)
- Training infrastructure (local, cloud, distributed)
- Deployment platform (Kubernetes, SageMaker, custom)

**Architecture deliverable:**
```markdown
## ML Pipeline Architecture

### Components
1. Data Ingestion: [Tool/approach]
2. Data Processing: [Framework]
3. Feature Store: [Optional - tool]
4. Training: [Framework and infrastructure]
5. Experiment Tracking: [Tool]
6. Model Registry: [Tool]
7. Deployment: [Platform]
8. Monitoring: [Tool]

### Data Flow
[Source] → [Processing] → [Training] → [Registry] → [Deployment] → [Monitoring]

### Technology Stack
- Language: Python [version]
- ML Framework: [PyTorch/TensorFlow/scikit-learn]
- Data Processing: [pandas/Spark/Dask]
- Orchestration: [Airflow/Prefect/Kubeflow/Metaflow]
- Deployment: [FastAPI/Flask/TorchServe/TFServing]
- Infrastructure: [AWS/GCP/Azure/On-prem]
```

### Phase 2: Data Pipeline (15-20 minutes)

**Objective**: Build data ingestion and processing pipeline

Use the **data-engineer** agent to:
1. Design data ingestion strategy
2. Implement data validation checks
3. Create ETL/ELT pipelines
4. Set up data versioning
5. Implement data quality monitoring

Use the **data-scientist** agent to:
1. Perform exploratory data analysis (EDA)
2. Identify data quality issues
3. Design data preprocessing steps
4. Handle missing values and outliers
5. Plan data split strategy (train/val/test)

Use the **python-pro** agent to:
1. Implement data loading utilities
2. Write data validation scripts
3. Create data preprocessing functions
4. Implement data augmentation (if needed)

**Data pipeline components:**
```python
# Data validation
def validate_data(df):
    """Validate data quality and schema"""
    - Check for missing values
    - Validate data types
    - Check value ranges
    - Detect outliers
    - Verify schema compliance

# Data preprocessing
def preprocess_data(df):
    """Clean and transform data"""
    - Handle missing values
    - Encode categorical variables
    - Scale numerical features
    - Remove duplicates
    - Handle outliers

# Data splitting
def split_data(df, test_size=0.2, val_size=0.2):
    """Split data for training, validation, and testing"""
    - Stratified splitting (if classification)
    - Time-based splitting (if time series)
    - Random splitting
```

**Data versioning:**
- Use DVC (Data Version Control)
- Or implement custom data versioning
- Track data lineage

### Phase 3: Feature Engineering (10-15 minutes)

**Objective**: Create and select features

Use the **data-scientist** agent to:
1. Design feature engineering strategy
2. Create domain-specific features
3. Implement feature selection
4. Handle feature scaling/normalization
5. Create feature documentation

Use the **ml-engineer** agent to:
1. Implement feature engineering pipeline
2. Create feature store (optional)
3. Implement feature serving for inference
4. Ensure feature consistency (train/serve)

**Feature engineering patterns:**
```python
# Feature creation
def create_features(df):
    """Engineer features from raw data"""
    - Aggregations (mean, sum, count)
    - Interactions (product, ratio)
    - Temporal features (day, month, lag)
    - Text features (TF-IDF, embeddings)
    - Domain-specific features

# Feature selection
def select_features(X, y):
    """Select most relevant features"""
    - Correlation analysis
    - Feature importance (tree-based)
    - Recursive feature elimination
    - L1 regularization
```

**Feature store (if using):**
- Implement with Feast, Tecton, or custom solution
- Ensure feature consistency across environments
- Enable feature reuse across models

### Phase 4: Model Training (15-25 minutes)

**Objective**: Train and optimize ML models

Use the **ml-engineer** agent to:
1. Implement model training pipeline
2. Set up experiment tracking
3. Implement hyperparameter tuning
4. Add checkpointing and early stopping
5. Implement distributed training (if needed)

Use the **data-scientist** agent to:
1. Select appropriate algorithms
2. Design model architecture (if deep learning)
3. Choose evaluation metrics
4. Design cross-validation strategy
5. Perform hyperparameter tuning

Use the **mlops-engineer** agent to:
1. Implement experiment tracking (MLflow, W&B)
2. Log metrics, parameters, artifacts
3. Version models
4. Track lineage (data → code → model)

**Training pipeline components:**
```python
# Training function
def train_model(X_train, y_train, X_val, y_val, config):
    """Train ML model with given configuration"""
    1. Initialize model
    2. Set up experiment tracking
    3. Train with validation
    4. Log metrics and artifacts
    5. Save best model
    6. Return trained model and metrics

# Hyperparameter tuning
def tune_hyperparameters(X_train, y_train, X_val, y_val):
    """Find optimal hyperparameters"""
    - Grid search
    - Random search
    - Bayesian optimization (Optuna, Hyperopt)
    - Track all experiments
```

**Experiment tracking:**
```python
import mlflow

with mlflow.start_run():
    # Log parameters
    mlflow.log_params(config)

    # Train model
    model = train_model(...)

    # Log metrics
    mlflow.log_metrics(metrics)

    # Log model
    mlflow.sklearn.log_model(model, "model")

    # Log artifacts
    mlflow.log_artifacts("outputs/")
```

### Phase 5: Model Evaluation and Validation (10-15 minutes)

**Objective**: Comprehensively evaluate model performance

Use the **data-scientist** agent to:
1. Calculate performance metrics
2. Perform error analysis
3. Check for bias and fairness
4. Validate on held-out test set
5. Compare with baseline models

Use the **ml-engineer** agent to:
1. Implement evaluation pipeline
2. Create model comparison reports
3. Implement A/B testing framework
4. Set up model validation gates

**Evaluation components:**
```python
# Comprehensive evaluation
def evaluate_model(model, X_test, y_test, task_type):
    """Evaluate model on test set"""

    For classification:
    - Accuracy, Precision, Recall, F1
    - ROC-AUC, PR-AUC
    - Confusion matrix
    - Classification report

    For regression:
    - MSE, RMSE, MAE
    - R², Adjusted R²
    - Residual analysis

    For all:
    - Cross-validation scores
    - Learning curves
    - Feature importance
    - Error analysis by segment

# Bias and fairness check
def check_fairness(model, X_test, y_test, sensitive_features):
    """Check for algorithmic bias"""
    - Disparate impact analysis
    - Equal opportunity difference
    - Performance across groups
```

**Model validation gates:**
- Minimum accuracy threshold
- Maximum bias/fairness metrics
- Performance on critical segments
- Comparison with baseline/production model

### Phase 6: Model Deployment (15-20 minutes)

**Objective**: Deploy model to production

Use the **ml-engineer** agent to:
1. Implement model serving code
2. Create prediction API
3. Add input validation
4. Implement batch prediction (if needed)
5. Set up model versioning in production

Use the **deployment-engineer** agent to:
1. Create deployment pipeline (CI/CD for ML)
2. Containerize model (Docker)
3. Deploy to serving platform
4. Set up load balancing and scaling
5. Implement canary/blue-green deployment

Use the **security-auditor** agent to:
1. Secure model endpoints
2. Add authentication/authorization
3. Implement rate limiting
4. Protect model from adversarial attacks

**Deployment approaches:**

#### REST API Deployment:
```python
# FastAPI serving
from fastapi import FastAPI
import mlflow

app = FastAPI()
model = mlflow.pyfunc.load_model("models:/my-model/production")

@app.post("/predict")
async def predict(features: dict):
    """Serve predictions via REST API"""
    - Validate input
    - Preprocess features
    - Make prediction
    - Format response
    - Log request/response
```

#### Batch Deployment:
```python
# Batch prediction pipeline
def batch_predict(input_path, output_path, model_uri):
    """Run batch predictions on large datasets"""
    1. Load data in chunks
    2. Load model
    3. Process in batches
    4. Save predictions
    5. Log metrics
```

**Containerization:**
```dockerfile
# Dockerfile for model serving
FROM python:3.11-slim

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY model_service/ /app/
WORKDIR /app

EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
```

### Phase 7: Monitoring and Observability (10-15 minutes)

**Objective**: Monitor model performance in production

Use the **mlops-engineer** agent to:
1. Implement prediction logging
2. Set up performance monitoring
3. Implement data drift detection
4. Add model drift detection
5. Create alerting rules

Use the **performance-engineer** agent to:
1. Monitor latency and throughput
2. Track resource usage
3. Optimize inference performance
4. Set up profiling

**Monitoring components:**
```python
# Model monitoring
def monitor_predictions(predictions, features, actuals=None):
    """Monitor model predictions in production"""

    - Log predictions
    - Track prediction distribution
    - Detect data drift
    - Detect concept drift
    - Compare with training distribution

    If actuals available:
    - Calculate online metrics
    - Track performance over time
    - Trigger retraining if needed

# Data drift detection
def detect_data_drift(current_data, reference_data):
    """Detect distribution shifts"""
    - Statistical tests (KS test, Chi-square)
    - PSI (Population Stability Index)
    - Feature distribution comparison
    - Alert on significant drift
```

**Metrics to monitor:**
- **Model performance**: Accuracy, precision, recall, etc.
- **Data quality**: Missing values, outliers, schema violations
- **System performance**: Latency, throughput, errors
- **Data drift**: Feature distribution changes
- **Concept drift**: Target distribution changes
- **Business metrics**: Revenue impact, user satisfaction

**Alerting rules:**
- Model performance degradation > X%
- Data drift detected
- Prediction latency > X ms
- Error rate > X%
- Resource usage > X%

### Phase 8: Retraining Pipeline (10 minutes)

**Objective**: Automate model retraining

Use the **mlops-engineer** agent to:
1. Design retraining triggers
2. Implement automated retraining pipeline
3. Set up A/B testing for new models
4. Implement automated rollback
5. Create retraining schedule

**Retraining triggers:**
- **Scheduled**: Retrain every X days/weeks
- **Performance-based**: Retrain when performance drops > X%
- **Data-based**: Retrain when data drift detected
- **Manual**: On-demand retraining

**Retraining pipeline:**
```python
# Automated retraining
def retrain_pipeline():
    """Automated model retraining"""
    1. Fetch new data
    2. Validate data quality
    3. Combine with existing data (if incremental)
    4. Retrain model
    5. Evaluate on test set
    6. Compare with production model
    7. If better: deploy new model (canary/blue-green)
    8. If worse: alert team and investigate
    9. Log everything
```

## ML Pipeline Tools and Frameworks

### Orchestration
- **Airflow** - Workflow orchestration
- **Prefect** - Modern workflow orchestration
- **Kubeflow** - Kubernetes-native ML workflows
- **Metaflow** - Data science workflow framework
- **ZenML** - MLOps framework

### Experiment Tracking
- **MLflow** - Experiment tracking, model registry
- **Weights & Biases** - Experiment tracking and collaboration
- **Neptune.ai** - Experiment management
- **TensorBoard** - TensorFlow visualization

### Model Serving
- **FastAPI** - Modern REST API framework
- **TorchServe** - PyTorch model serving
- **TensorFlow Serving** - TensorFlow model serving
- **BentoML** - ML model serving framework
- **Seldon** - Kubernetes-native ML serving

### Monitoring
- **Evidently** - ML monitoring and data drift
- **WhyLabs** - ML observability
- **Arize** - ML observability platform
- **Great Expectations** - Data validation

## Agent Orchestration

### Phase 1 (Run in Parallel):
- **architect-review** - Overall architecture
- **mlops-engineer** - MLOps infrastructure design

### Phase 2 (Run in Parallel):
- **data-engineer** - Data pipeline
- **data-scientist** - EDA and preprocessing
- **python-pro** - Implementation

### Phase 3 (Run in Parallel):
- **data-scientist** - Feature engineering design
- **ml-engineer** - Feature pipeline implementation

### Phase 4 (Run in Parallel):
- **ml-engineer** - Training implementation
- **data-scientist** - Model selection and tuning
- **mlops-engineer** - Experiment tracking setup

### Phase 5 (Sequential):
- **data-scientist** - Evaluation
- **ml-engineer** - Validation pipeline

### Phase 6 (Run in Parallel):
- **ml-engineer** - Serving implementation
- **deployment-engineer** - Deployment pipeline
- **security-auditor** - Security review

### Phase 7 (Run in Parallel):
- **mlops-engineer** - Monitoring setup
- **performance-engineer** - Performance monitoring

### Phase 8 (Sequential):
- **mlops-engineer** - Retraining pipeline

## Best Practices

✅ **Do:**
- Version everything (data, code, models, configs)
- Track all experiments
- Automate as much as possible
- Monitor model performance continuously
- Implement proper testing (unit, integration, model tests)
- Use CI/CD for ML pipelines
- Document assumptions and decisions
- Ensure reproducibility
- Plan for model updates from day one
- Consider fairness and bias

❌ **Don't:**
- Don't skip data validation
- Don't ignore data drift
- Don't deploy without proper evaluation
- Don't forget to monitor in production
- Don't hardcode hyperparameters
- Don't ignore feature importance
- Don't skip error analysis
- Don't forget edge cases
- Don't neglect security
- Don't ignore technical debt

## ML Pipeline Checklist

### Data
- [ ] Data ingestion implemented
- [ ] Data validation in place
- [ ] Data versioning set up
- [ ] Data quality monitoring
- [ ] Train/val/test split defined

### Features
- [ ] Feature engineering implemented
- [ ] Feature selection performed
- [ ] Feature documentation created
- [ ] Feature consistency ensured (train/serve)

### Model
- [ ] Model training pipeline implemented
- [ ] Experiment tracking set up
- [ ] Hyperparameter tuning performed
- [ ] Model versioning in place
- [ ] Model registry configured

### Evaluation
- [ ] Comprehensive metrics calculated
- [ ] Error analysis performed
- [ ] Bias/fairness checked
- [ ] Model comparison done
- [ ] Validation gates defined

### Deployment
- [ ] Model serving implemented
- [ ] API/batch prediction working
- [ ] Containerization done
- [ ] CI/CD pipeline created
- [ ] Security measures in place

### Monitoring
- [ ] Prediction logging implemented
- [ ] Performance monitoring set up
- [ ] Data drift detection in place
- [ ] Alerting rules configured
- [ ] Retraining pipeline automated

## Output Format

After each phase, provide:
```markdown
## Phase X Complete: [Phase Name]

### What Was Built
- [Component 1]
- [Component 2]

### Files Created/Modified
- `path/to/file.py` - [Description]
- `path/to/config.yaml` - [Description]

### Key Decisions Made
- [Decision 1]: [Rationale]
- [Decision 2]: [Rationale]

### Metrics/Results
- [Relevant metrics or results]

### Next Steps
- [What comes next]
```

## Final Deliverable

```markdown
# ML Pipeline Summary

## Overview
- **Task**: [Classification/Regression/etc.]
- **Model**: [Algorithm/architecture]
- **Performance**: [Key metrics]

## Architecture
[Diagram or description]

## Components
1. Data Pipeline: [Description]
2. Feature Engineering: [Description]
3. Training Pipeline: [Description]
4. Deployment: [Description]
5. Monitoring: [Description]

## Model Performance
- Training: [Metrics]
- Validation: [Metrics]
- Test: [Metrics]

## How to Use

### Training
```bash
python train.py --config configs/train_config.yaml
```

### Inference
```bash
# API
curl -X POST http://localhost:8000/predict -d '{"features": {...}}'

# Batch
python batch_predict.py --input data/input.csv --output predictions.csv
```

### Monitoring
- Dashboard: [URL]
- Logs: [Location]
- Alerts: [Configuration]

## Next Steps
- [ ] [Improvement 1]
- [ ] [Improvement 2]
```

## Now, Begin!

Ask the user for their ML pipeline requirements, then proceed with the phased implementation using specialized ML and data agents.

**Remember**: Good MLOps is about automation, reproducibility, and continuous improvement.
