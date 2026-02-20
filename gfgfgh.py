import random
import os

def generate_pins():
    # 1. Ask the user where to save the file
    export_path = input("Enter the directory path to export the file (e.g., C:/Users/Documents or /home/user/): ").strip()
    
    # 2. Define the filename
    filename = "generate4digitspingeneratedpin.txt"
    full_path = os.path.join(export_path, filename)

    try:
        # 3. Generate all 10,000 unique 4-digit PINs
        print("Generating PINs...")
        pins = [f"{i:04d}" for i in range(10000)]
        
        # 4. Randomize the list
        random.shuffle(pins)

        # 5. Ensure the directory exists
        if not os.path.exists(export_path):
            os.makedirs(export_path)

        # 6. Write to the file
        with open(full_path, "w") as f:
            for pin in pins:
                f.write(pin + "\n")
        
        print(f"--- Export Successful ---")
        print(f"File saved to: {full_path}")

    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    generate_pins()
