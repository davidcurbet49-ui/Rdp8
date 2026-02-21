import random
import os
from datetime import datetime, timedelta

def create_payment_log():
    # User Specific Data
    wallet = "TPUmnSEok7ZAtwU4tgouaD1jeKy6hxU3qz"
    balance = "44987.775911"
    file_path = r"C:\Users\david\Downloads\python create.txt"
    
    # Logic for Expiry and PIN
    expiry_time = (datetime.now() + timedelta(minutes=60)).strftime("%H:%M:%S")
    generated_pin = random.randint(1000, 9999) # 4-digit PIN generation

    # Formatting the display
    log_content = f"""
--------------------------------------------------
PAYMENT METHOD SELECTION: USDT (TRC20)
--------------------------------------------------
TARGET WALLET: {wallet}
CURRENT BALANCE: {balance} USDT
STATUS: Pending Verification

TIME REMAINING: 60 Minutes
EXPIRES AT: {expiry_time}
GENERATED PIN: {generated_pin}
--------------------------------------------------
"""

    # Printing to console for immediate view
    print(log_content)

    # Exporting to the local file
    try:
        # Ensure directory exists (though Downloads usually does)
        os.makedirs(os.path.dirname(file_path), exist_ok=True)
        
        with open(file_path, "w") as f:
            f.write(log_content)
        print(f"Successfully exported to: {file_path}")
    except Exception as e:
        print(f"Error saving file: {e}")

if __name__ == "__main__":
    create_payment_log()
