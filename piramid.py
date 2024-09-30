import tkinter as tk
import math

class RotatingPyramidVR:
    def __init__(self, root):
        self.root = root
        self.root.title("simulator VR: pyramid")
        self.root.geometry("640x480")
        self.root.configure(bg="black")

        # Canvas para desenhar a simulação VR
        self.canvas = tk.Canvas(root, width=480, height=480, bg="black", highlightthickness=0)
        self.canvas.pack()

        # Dividindo a tela em duas partes com uma linha branca
        self.canvas.create_line(240, 0, 240, 480, fill="white", width=2)

        # Define os vértices da pirâmide (base quadrada e vértice superior)
        self.vertices = [
            [-1, -1, -1],  # Base inferior esquerda
            [1, -1, -1],   # Base inferior direita
            [1, -1, 1],    # Base superior direita
            [-1, -1, 1],   # Base superior esquerda
            [0, 1, 0]      # Vértice da pirâmide
        ]

        # Define as arestas que conectam os vértices
        self.edges = [
            (0, 1), (1, 2), (2, 3), (3, 0),  # Arestas da base
            (0, 4), (1, 4), (2, 4), (3, 4)   # Arestas ligando a base ao vértice
        ]

        # Ângulos de rotação
        self.angle_x = 0
        self.angle_y = 0
        self.angle_z = 0

        # Inicia a rotação
        self.update_pyramid()

    def project_point(self, point, width, height, scale=150):
        """Projeção 3D para 2D"""
        x, y, z = point
        factor = scale / (z + 5)  # Projeção em perspectiva simples
        x_proj = int(x * factor + width / 2)
        y_proj = int(y * factor + height / 2)
        return x_proj, y_proj

    def rotate(self, x, y, z, angle_x, angle_y, angle_z):
        """Rotaciona um ponto 3D em torno dos eixos X, Y e Z"""
        # Rotação em torno do eixo X
        cos_x, sin_x = math.cos(angle_x), math.sin(angle_x)
        y1, z1 = y * cos_x - z * sin_x, y * sin_x + z * cos_x

        # Rotação em torno do eixo Y
        cos_y, sin_y = math.cos(angle_y), math.sin(angle_y)
        x2, z2 = x * cos_y + z1 * sin_y, -x * sin_y + z1 * cos_y

        # Rotação em torno do eixo Z
        cos_z, sin_z = math.cos(angle_z), math.sin(angle_z)
        x3, y3 = x2 * cos_z - y1 * sin_z, x2 * sin_z + y1 * cos_z

        return x3, y3, z2

    def draw_pyramid(self):
        self.canvas.delete("pyramid")

        # Rotaciona e projeta os vértices
        rotated_vertices = []
        for vertex in self.vertices:
            x, y, z = self.rotate(*vertex, self.angle_x, self.angle_y, self.angle_z)
            rotated_vertices.append((x, y, z))

        # Desenha a pirâmide no lado esquerdo
        for edge in self.edges:
            p1 = self.project_point(rotated_vertices[edge[0]], 320, 480)
            p2 = self.project_point(rotated_vertices[edge[1]], 320, 480)
            self.canvas.create_line(p1, p2, fill="white", tags="pyramid")

        # Desenha a pirâmide no lado direito (com deslocamento de 320 px)
        for edge in self.edges:
            p1 = self.project_point(rotated_vertices[edge[0]], 640, 480)
            p2 = self.project_point(rotated_vertices[edge[1]], 640, 480)
            self.canvas.create_line(p1, p2, fill="white", tags="pyramid")

    def update_pyramid(self):
        # Atualiza os ângulos para rotacionar continuamente
        self.angle_x += 0.03
        self.angle_y += 0.02
        self.angle_z += 0.01

        # Redesenha a pirâmide
        self.draw_pyramid()

        # Repetir a atualização a cada 50 milissegundos
        self.root.after(50, self.update_pyramid)

if __name__ == "__main__":
    root = tk.Tk()
    app = RotatingPyramidVR(root)
    root.mainloop()

