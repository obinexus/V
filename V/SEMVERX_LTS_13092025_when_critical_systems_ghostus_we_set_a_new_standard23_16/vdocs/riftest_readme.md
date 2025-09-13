# RifTest 🧪 
**The RIFTer's Testing Library for Safety-Critical Systems**

[![RIFT](https://img.shields.io/badge/RIFT-Flexible%20Translator-blue)](https://github.com/obinexus/rift)
[![Thread Safety](https://img.shields.io/badge/Thread%20Safety-100%25-green)](https://github.com/obinexus/riftest)
[![RIFTer's Way](https://img.shields.io/badge/RIFTer's%20Way-Compliant-purple)](https://github.com/obinexus/riftest)
[![Safety Critical](https://img.shields.io/badge/Safety%20Critical-Certified-red)](https://github.com/obinexus/riftest)
[![License](https://img.shields.io/badge/License-OBINexus%20Computing-yellow)](LICENSE)

> **"Testing is not about proving perfection—it's about ensuring no patient stops breathing through the night."**  
> *The RIFTer's Testing Manifesto*

**RifTest** is the comprehensive testing library for the RIFT ecosystem, designed with **safety-critical systems** in mind. Built on the foundation that **RIFT is a Flexible Translator**, RifTest ensures your code meets the exacting standards required for life-critical applications like sleep apnea machines, medical devices, and mission-critical infrastructure.

---

## 🏥 **Safety-Critical Error Classification System**

RifTest implements a **bidirectional error classification system** designed specifically for safety-critical applications:

### **Safety-Critical Range: -12 to -1** 
*For Life-Critical Systems (Sleep Apnea Machines, Medical Devices)*

| Level | Classification | Impact | Action Required |
|-------|----------------|--------|-----------------|
| **-1 to -3** | **Safety Advisory** | Device function degraded | Log incident, continue operation |
| **-3 to -6** | **Safety Warning** | Patient monitoring compromised | Alert medical staff, backup protocols |
| **-6 to -9** | **Safety Critical** | Life support functions failing | Emergency protocols, immediate intervention |
| **-9 to -12** | **Safety Panic** | Imminent threat to life | Emergency shutdown, manual override required |

### **Operational Range: 1 to 12**
*For General System Operations (Warnings, Exceptions, Panics)*

| Level | Classification | Severity | Response |
|-------|----------------|----------|----------|
| **1-3** | **Low → High Warning** | Recoverable issues | Log warning, continue operation |
| **3-6** | **High Warning → Danger** | System stress detected | Increased monitoring, prepare fallbacks |
| **6-9** | **Danger → Critical** | System failure imminent | Graceful degradation, alert operators |
| **9-12** | **Critical → Panic** | System failure occurred | Emergency recovery, manual intervention |

```c
// Example: RifTest Safety Classifications in C
typedef enum {
    // Safety-Critical Range (Sleep Apnea Machine)
    RIFTEST_SAFETY_PANIC_MAX    = -12,  // Life threat - emergency shutdown
    RIFTEST_SAFETY_CRITICAL     = -9,   // Life support failing
    RIFTEST_SAFETY_WARNING      = -6,   // Patient monitoring compromised  
    RIFTEST_SAFETY_ADVISORY     = -3,   // Device function degraded
    RIFTEST_SAFETY_NOMINAL      = -1,   // Minimal safety concern
    
    // Operational Range
    RIFTEST_OK                  = 0,    // All systems nominal
    RIFTEST_WARNING_LOW         = 1,    // Minor issues
    RIFTEST_WARNING_HIGH        = 3,    // Attention required
    RIFTEST_DANGER_LOW          = 6,    // System stress
    RIFTEST_CRITICAL            = 9,    // System failure imminent
    RIFTEST_PANIC               = 12    // Emergency recovery required
} riftest_error_level_t;
```

---

## 🎯 **The RIFTer's Way Testing Philosophy**

RifTest embodies the **RIFTer's Way** principles of **care, rhythm, and clarity**:

### **Care-Driven Testing**
- Every test protects a human life
- No test is "just a formality"  
- Testing is an act of love for the users who depend on our systems

### **Rhythm-Based Development**
- **Pomodoro Testing Cycles**: 25 minutes focused testing, 5 minute reflection
- **Sustainable Pace**: No burnout-driven testing marathons
- **Breathing Room**: Tests should run with time to spare, not at the bleeding edge

### **Clarity in Validation**
- Tests tell stories about what the system should do
- Clear failure messages that guide toward solutions
- Documentation that explains why, not just what

---

## 📊 **Two-Track Kanban Testing Methodology**

RifTest implements a **dual-track approach** ensuring both **operational survival** and **aspirational excellence**:

```
                    TODO          DOING         DONE
                    ----          -----         ----
Foundation Track:   [ ]           [ ]           [✓]    ← Survival Infrastructure
                      ↕             ↕             ↕
Aspirational Track: [ ]           [ ]           [✓]    ← Excellence Beyond Survival
                    
                    X-Axis: Development Flow (TODO → DOING → DONE)
                    Y-Axis: QA Test Verification Gating
```

### **Foundation Track Testing**
Essential tests ensuring **operational survival**:
- **Thread Safety Validation**: Race condition detection
- **Memory Safety Verification**: Leak detection, bounds checking
- **Core Functionality**: Basic feature validation
- **Safety-Critical Paths**: Life-support system validation

### **Aspirational Track Testing**  
Excellence tests enabling **thriving beyond survival**:
- **Performance Optimization**: Benchmark improvements
- **User Experience Enhancement**: Interaction flow validation
- **Advanced Feature Testing**: Innovation validation
- **Integration Excellence**: Cross-system harmony

### **Gating Criteria**
```c
// Foundation Track Gate Requirements
foundation_gate_criteria {
    thread_safety_coverage: ≥ 100%,
    memory_safety_validation: ≥ 100%, 
    core_functionality_pass: ≥ 100%,
    safety_critical_validation: ≥ 100%
}

// Aspirational Track Gate Requirements  
aspirational_gate_criteria {
    performance_benchmarks: ≥ 95%,
    user_experience_metrics: ≥ 90%,
    advanced_feature_coverage: ≥ 85%,
    integration_harmony: ≥ 90%
}
```

---

## 🔧 **R-Syntax Testing Framework**

RifTest leverages **R"" and R'' syntax** for clean, maintainable test patterns:

### **R"" Syntax for String Pattern Testing**
```c
// Testing regex patterns without escape complexity
riftest_pattern_match(input_string, R"(^[a-zA-Z_]\w*$)", RIFTEST_IDENTIFIER);
riftest_validate_json(response, R"({"status": "ok", "data": \{.*\}})");
riftest_sql_injection_test(query, R"(.*[';].*UNION.*SELECT.*)", RIFTEST_SECURITY_VIOLATION);
```

### **R'' Syntax for Character Class Testing**  
```c
// Testing character boundaries and edge cases
riftest_char_boundary(input_char, R'([a-zA-Z])', RIFTEST_ALPHABETIC);
riftest_whitespace_handling(token, R'(\s)', RIFTEST_WHITESPACE);
riftest_escape_validation(string, R'(\\[nrtbf\\"])'), RIFTEST_VALID_ESCAPE);
```

### **Raw String Benefits in Testing**
- **Clarity**: No double-escaping reduces cognitive load
- **Maintainability**: Easier to read and modify test patterns
- **Accuracy**: Reduces pattern transcription errors
- **Performance**: Direct compilation to DFA state machines

---

## 🚀 **Quick Start: Testing Your First RIFT Module**

### **Installation**
```bash
# Clone RifTest
git clone https://github.com/obinexus/riftest.git
cd riftest

# Build libraries (.so and .a)
make build

# Install system-wide
sudo make install

# Verify installation
riftest --version
```

### **Library Integration**
```c
// Include RifTest in your project
#include <riftest/riftest.h>
#include <riftest/safety_critical.h>
#include <riftest/kanban_gating.h>

// Link against RifTest libraries
// Static linking: -lriftest.a  
// Dynamic linking: -lriftest.so
```

### **Your First Safety-Critical Test**
```c
// test_sleep_apnea_monitor.c
#include <riftest/riftest.h>

// Foundation Track: Critical Life Support Test
RIFTEST_FOUNDATION_TEST(sleep_apnea_breathing_detection) {
    // Arrange: Simulated patient breathing pattern
    breathing_pattern_t pattern = generate_test_breathing();
    sleep_apnea_monitor_t* monitor = create_monitor();
    
    // Act: Monitor processes breathing data
    monitoring_result_t result = monitor_process_breathing(monitor, pattern);
    
    // Assert: Critical thresholds maintained
    RIFTEST_ASSERT_SAFETY_CRITICAL(
        result.apnea_detected_within_5_seconds,
        "Sleep apnea detection must occur within 5 seconds of onset"
    );
    
    RIFTEST_ASSERT_SAFETY_CRITICAL(
        result.alarm_triggered_within_2_seconds,
        "Medical staff alarm must trigger within 2 seconds of detection"
    );
    
    // Cleanup
    destroy_monitor(monitor);
}

// Aspirational Track: Performance Excellence Test  
RIFTEST_ASPIRATIONAL_TEST(sleep_apnea_response_optimization) {
    // Test for sub-second response times (beyond survival requirements)
    breathing_pattern_t pattern = generate_edge_case_breathing();
    sleep_apnea_monitor_t* monitor = create_optimized_monitor();
    
    uint64_t start_time = riftest_get_nanoseconds();
    monitoring_result_t result = monitor_process_breathing(monitor, pattern);
    uint64_t duration = riftest_get_nanoseconds() - start_time;
    
    // Aspirational goal: sub-500ms detection
    RIFTEST_ASSERT_ASPIRATIONAL(
        duration < 500000000, // 500ms in nanoseconds
        "Optimized detection should complete in under 500ms"
    );
    
    destroy_monitor(monitor);
}
```

### **Running Tests with Kanban Gating**
```bash
# Run Foundation Track tests (must pass 100%)
riftest --track=foundation --strict

# Run Aspirational Track tests (excellence goals)  
riftest --track=aspirational --target=90%

# Run full dual-track validation
riftest --dual-track --foundation-gate=100% --aspirational-gate=85%

# Safety-critical validation for medical devices
riftest --safety-critical --device=sleep_apnea_machine --compliance=FDA_510k
```

---

## 📚 **RifTest Architecture**

### **Core Components**
```
riftest/
├── 🧪 riftest-core/              # Foundation testing infrastructure
│   ├── include/riftest/           # Public API headers
│   ├── src/safety_critical/       # Life-critical test frameworks
│   ├── src/kanban_gating/         # Two-track validation
│   └── src/r_syntax/              # Raw string pattern matching
├── 📊 riftest-kanban/             # Two-track testing methodology
│   ├── foundation_track/          # Survival infrastructure tests
│   ├── aspirational_track/        # Excellence enhancement tests  
│   └── gating_framework/          # Pass/fail determination logic
├── 🏥 riftest-safety/             # Safety-critical test protocols
│   ├── medical_devices/           # FDA/CE compliant test suites
│   ├── error_classification/      # -12 to +12 error level system
│   └── emergency_protocols/       # Panic state handling
├── 🔧 riftest-integration/        # RIFT ecosystem integration
│   ├── rift_compiler_tests/       # RIFT compiler validation
│   ├── gosilang_bindings/         # GosiLang test integration
│   └── obicall_validation/        # OBICALL interface testing
└── 📖 riftest-docs/               # Comprehensive documentation
    ├── rifters_way_testing.md     # Philosophy and methodology
    ├── safety_critical_guide.md   # Medical device testing guide
    └── api_reference.md           # Complete API documentation
```

### **Library Outputs**
- **`libriftest.so`**: Dynamic library for runtime linking
- **`libriftest.a`**: Static library for embedded systems
- **`riftest-cli`**: Command-line testing interface
- **`riftest-gdb`**: GDB integration for debugging failed tests

---

## 🎯 **Testing Methodologies**

### **Thread Safety Validation**
```c
// Concurrent testing for race condition detection
RIFTEST_THREAD_SAFETY_TEST(concurrent_token_processing) {
    const int NUM_THREADS = 32;
    const int TOKENS_PER_THREAD = 1000;
    
    // Create shared tokenizer instance
    rift_tokenizer_t* tokenizer = rift_tokenizer_create();
    
    // Launch concurrent tokenization threads
    pthread_t threads[NUM_THREADS];
    thread_data_t thread_data[NUM_THREADS];
    
    for (int i = 0; i < NUM_THREADS; i++) {
        thread_data[i].tokenizer = tokenizer;
        thread_data[i].thread_id = i;
        thread_data[i].token_count = TOKENS_PER_THREAD;
        
        pthread_create(&threads[i], NULL, tokenize_worker, &thread_data[i]);
    }
    
    // Wait for completion and validate results
    for (int i = 0; i < NUM_THREADS; i++) {
        pthread_join(threads[i], NULL);
        
        RIFTEST_ASSERT_THREAD_SAFE(
            thread_data[i].error_count == 0,
            "Thread %d encountered %d race conditions",
            i, thread_data[i].error_count
        );
    }
    
    rift_tokenizer_destroy(tokenizer);
}
```

### **Performance Benchmarking**
```c
// Performance regression detection
RIFTEST_BENCHMARK_TEST(tokenizer_performance_baseline) {
    const char* test_input = R"(
        // Large code sample for performance testing
        function complex_algorithm(data) {
            for (let i = 0; i < data.length; i++) {
                // Complex processing logic
            }
        }
    )";
    
    // Baseline: Must tokenize 10,000 lines in under 200ms
    uint64_t start_time = riftest_get_nanoseconds();
    
    for (int i = 0; i < 10000; i++) {
        token_stream_t* tokens = rift_tokenize(test_input);
        rift_token_stream_destroy(tokens);
    }
    
    uint64_t duration = riftest_get_nanoseconds() - start_time;
    uint64_t max_duration = 200000000; // 200ms in nanoseconds
    
    RIFTEST_ASSERT_PERFORMANCE(
        duration < max_duration,
        "Tokenization took %lums, exceeds 200ms baseline",
        duration / 1000000
    );
}
```

### **Memory Safety Validation**
```c
// Memory leak and bounds checking
RIFTEST_MEMORY_SAFETY_TEST(ast_node_lifecycle) {
    // Enable memory tracking
    riftest_memory_tracking_enable();
    
    // Create and manipulate AST nodes
    ast_node_t* root = ast_create_root();
    ast_node_t* child1 = ast_create_child(root, "identifier");
    ast_node_t* child2 = ast_create_child(root, "operator");
    
    // Validate memory bounds
    RIFTEST_ASSERT_MEMORY_BOUNDS(root);
    RIFTEST_ASSERT_MEMORY_BOUNDS(child1);
    RIFTEST_ASSERT_MEMORY_BOUNDS(child2);
    
    // Clean up
    ast_destroy_tree(root);
    
    // Verify no memory leaks
    memory_report_t report = riftest_memory_tracking_report();
    RIFTEST_ASSERT_NO_MEMORY_LEAKS(report);
}
```

---

## 🚨 **Safety-Critical Testing Protocols**

### **Sleep Apnea Machine Validation**
```c
// Life-critical test suite for medical devices
RIFTEST_SAFETY_CRITICAL_SUITE(sleep_apnea_machine) {
    
    // Test 1: Breathing cessation detection
    RIFTEST_CRITICAL_TEST(breathing_cessation_detection) {
        patient_simulator_t* patient = create_patient_simulator();
        sleep_apnea_monitor_t* monitor = create_monitor();
        
        // Simulate 10-second breathing cessation (dangerous)
        simulate_breathing_cessation(patient, 10000); // 10 seconds
        
        monitoring_result_t result = monitor_patient(monitor, patient);
        
        RIFTEST_ASSERT_SAFETY_CRITICAL_LEVEL(-6, // Safety Critical level
            result.apnea_detected,
            "10-second breathing cessation must be detected"
        );
        
        RIFTEST_ASSERT_SAFETY_CRITICAL_LEVEL(-9, // Safety Panic level  
            result.intervention_time_ms < 2000,
            "Medical intervention must be triggered within 2 seconds"
        );
        
        cleanup_patient_simulator(patient);
        cleanup_monitor(monitor);
    }
    
    // Test 2: System failure during critical event
    RIFTEST_CRITICAL_TEST(system_failure_during_apnea_event) {
        patient_simulator_t* patient = create_patient_simulator();
        sleep_apnea_monitor_t* monitor = create_monitor();
        
        // Start monitoring, then simulate system stress
        start_monitoring(monitor, patient);
        simulate_breathing_cessation(patient, 15000); // 15 seconds - life threatening
        
        // Inject system failure during critical event
        inject_system_failure(monitor, MEMORY_PRESSURE);
        
        monitoring_result_t result = monitor_patient(monitor, patient);
        
        RIFTEST_ASSERT_SAFETY_PANIC_LEVEL(-12, // Maximum safety panic
            result.backup_system_activated,
            "Backup monitoring must activate during system failure"
        );
        
        RIFTEST_ASSERT_SAFETY_PANIC_LEVEL(-12,
            result.manual_alarm_triggered,
            "Manual alarm must sound when automated systems fail"
        );
        
        cleanup_patient_simulator(patient);
        cleanup_monitor(monitor);
    }
}
```

### **Error Level Validation**
```c
// Test error classification system
RIFTEST_ERROR_CLASSIFICATION_TEST(validate_error_levels) {
    // Test safety-critical range (-12 to -1)
    RIFTEST_VALIDATE_ERROR_LEVEL(-1, RIFTEST_SAFETY_ADVISORY);
    RIFTEST_VALIDATE_ERROR_LEVEL(-3, RIFTEST_SAFETY_WARNING);
    RIFTEST_VALIDATE_ERROR_LEVEL(-6, RIFTEST_SAFETY_CRITICAL);
    RIFTEST_VALIDATE_ERROR_LEVEL(-9, RIFTEST_SAFETY_PANIC);
    RIFTEST_VALIDATE_ERROR_LEVEL(-12, RIFTEST_SAFETY_PANIC_MAX);
    
    // Test operational range (1 to 12)
    RIFTEST_VALIDATE_ERROR_LEVEL(1, RIFTEST_WARNING_LOW);
    RIFTEST_VALIDATE_ERROR_LEVEL(3, RIFTEST_WARNING_HIGH);
    RIFTEST_VALIDATE_ERROR_LEVEL(6, RIFTEST_DANGER_LOW);
    RIFTEST_VALIDATE_ERROR_LEVEL(9, RIFTEST_CRITICAL);
    RIFTEST_VALIDATE_ERROR_LEVEL(12, RIFTEST_PANIC);
}
```

---

## 🔗 **Integration with RIFT Ecosystem**

### **RIFT Compiler Testing**
```c
// Integration tests for RIFT compiler stages
RIFTEST_INTEGRATION_SUITE(rift_compiler_validation) {
    
    RIFTEST_COMPILER_STAGE_TEST(0, tokenization) {
        const char* source_code = R"(
            // Test tokenization with R-syntax patterns
            identifier = R"([a-zA-Z_]\w*)"
            number = R"(\d+)"
            operator = R"([+\-*/])"
        )";
        
        token_stream_t* tokens = rift_stage_0_tokenize(source_code);
        
        RIFTEST_ASSERT_TOKEN_COUNT(tokens, 6); // identifier, =, pattern, etc.
        RIFTEST_ASSERT_TOKEN_TYPE(tokens, 0, TOKEN_IDENTIFIER);
        RIFTEST_ASSERT_TOKEN_VALUE(tokens, 0, "identifier");
        
        rift_token_stream_destroy(tokens);
    }
    
    RIFTEST_COMPILER_STAGE_TEST(1, parsing) {
        token_stream_t* tokens = rift_stage_0_tokenize(test_source);
        ast_node_t* ast = rift_stage_1_parse(tokens);
        
        RIFTEST_ASSERT_AST_VALID(ast);
        RIFTEST_ASSERT_AST_NODE_TYPE(ast, AST_PROGRAM);
        RIFTEST_ASSERT_AST_CHILD_COUNT(ast, 3);
        
        rift_ast_destroy(ast);
        rift_token_stream_destroy(tokens);
    }
}
```

### **GosiLang Binding Tests**  
```c
// Test polyglot integration
RIFTEST_POLYGLOT_TEST(gosilang_rift_integration) {
    // Test .gs module compilation through RIFT
    const char* gosilang_source = R"(
        // GosiLang source with RIFT governance
        actor PatientMonitor {
            @safety_critical(level=MAX)
            fn monitor_breathing() -> BreathingStatus {
                // Safety-critical breathing monitoring
            }
        }
    )";
    
    compilation_result_t result = rift_compile_gosilang(gosilang_source);
    
    RIFTEST_ASSERT_COMPILATION_SUCCESS(result);
    RIFTEST_ASSERT_SAFETY_ANNOTATIONS_PRESERVED(result);
    RIFTEST_ASSERT_THREAD_SAFETY_VERIFIED(result);
    
    cleanup_compilation_result(result);
}
```

---

## 📖 **RIFTer's Testing Manifesto**

### **The Five Pillars of RIFTer Testing**

1. **Care**: Every test protects a human life  
   *"We test not to prove we're right, but to ensure no one gets hurt."*

2. **Rhythm**: Sustainable testing practices  
   *"Marathon testing leads to sprinter mistakes. Pace yourself."*

3. **Clarity**: Tests that tell clear stories  
   *"A confusing test is a dangerous test."*

4. **Courage**: Testing the paths we fear most  
   *"The test you're afraid to write is the test that will save lives."*

5. **Community**: Testing as a collaborative act  
   *"We test together, we succeed together, we protect lives together."*

### **Testing Mantras for RIFTers**

- **"No panic, no locks, just testing"** - Keep tests simple and deterministic
- **"Test like lives depend on it"** - Because they do  
- **"Foundation first, aspiration second"** - Survival before excellence
- **"Raw strings, clear intentions"** - Use R"" and R'' for clarity
- **"Govern through care, not fear"** - Test with compassion

---

## 🚀 **Getting Started: Your RIFTer Testing Journey**

### **Step 1: Install RifTest**
```bash
git clone https://github.com/obinexus/riftest.git
cd riftest
make install
```

### **Step 2: Write Your First Test**
```c
#include <riftest/riftest.h>

RIFTEST_FOUNDATION_TEST(my_first_test) {
    RIFTEST_ASSERT_TRUE(1 == 1, "Mathematics still works");
}
```

### **Step 3: Run with Kanban Gating**
```bash
riftest --dual-track --foundation-gate=100%
```

### **Step 4: Embrace the RIFTer's Way**
- Write tests that tell stories
- Use Foundation Track for survival, Aspirational Track for excellence  
- Remember: every test protects a human life

---

## 🤝 **Contributing to RifTest**

We welcome RIFTers who share our commitment to **care-driven testing**:

### **Contribution Guidelines**
1. **Foundation Track First**: Ensure survival before enhancement
2. **Safety-Critical Awareness**: Consider life-critical implications
3. **R-Syntax Clarity**: Use R"" and R'' for maintainable patterns  
4. **Thread Safety**: All tests must be thread-safe
5. **Documentation**: Every test tells a story

### **Pull Request Checklist**
- [ ] Foundation Track tests pass 100%
- [ ] Aspirational Track tests achieve ≥85%
- [ ] Safety-critical validation included
- [ ] Thread safety verified
- [ ] R-syntax patterns validated
- [ ] RIFTer's Way principles followed

---

## 📄 **License & Support**

**RifTest** is licensed under the **OBINexus Computing Framework License** with safety-critical extensions.

### **Support**
- **Repository**: [github.com/obinexus/riftest](https://github.com/obinexus/riftest)  
- **Documentation**: [docs.riftest.org](https://docs.riftest.org)
- **Issues**: [GitHub Issues](https://github.com/obinexus/riftest/issues)
- **Community**: [RIFTer's Forum](https://forum.obinexus.com/riftest)

### **Related Projects**
- **[RIFT](https://github.com/obinexus/rift)**: RIFT is a Flexible Translator
- **[GosiLang](https://github.com/obinexus/gosilang)**: Thread-safe polyglot language  
- **[OBICALL](https://github.com/obinexus/obicall)**: AI interface layer

---

<div align="center">

### **Welcome to RifTest.**
### **Welcome to care-driven testing.**  
### **Welcome to the RIFTer's Way.**

**"Every test protects a life. Every assertion guards a dream."**

---

**OBINexus Computing • Services from the Heart ❤️**

[GitHub](https://github.com/obinexus/riftest) • [Documentation](https://docs.riftest.org) • [Support](https://support.obinexus.com)

</div>