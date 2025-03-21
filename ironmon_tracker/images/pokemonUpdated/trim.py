from PIL import Image
import os

def crop_transparent(image_path, threshold=10):
    image = Image.open(image_path).convert("RGBA")
    alpha = image.split()[3]
    
    # Seuil pour filtrer les pixels quasi-transparents
    alpha_binary = alpha.point(lambda p: 255 if p > threshold else 0)
    bbox = alpha_binary.getbbox()

    if bbox:
        cropped_image = image.crop(bbox)
        cropped_image.save(image_path)
        print(f"Image rognée et sauvegardée : {image_path}")
    else:
        print(f"{image_path} est complètement transparent ou en-dessous du seuil.")


def process_images():
    current_directory = os.getcwd()

    for file in os.listdir(current_directory):
        if file.lower().endswith(".png"):
            crop_transparent(file)

if __name__ == "__main__":
    process_images()

