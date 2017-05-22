<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use FOS\UserBundle\Model\User;

/**
 * Ticket
 *
 * @ORM\Table(name="ticket", indexes={@ORM\Index(name="fk_ticket_projet_idx", columns={"id_projet"}), @ORM\Index(name="fk_ticket_statut1_idx", columns={"id_statut"}), @ORM\Index(name="fk_ticket_degre_importance1_idx", columns={"id_degre_importance"})})
 * @ORM\Entity(repositoryClass="AppBundle\Repository\TicketRepository")
 */
class Ticket
{
    /**
     * @var string
     *
     * @ORM\Column(name="libelle", type="string", length=255, nullable=false)
     */
    private $libelle;

    /**
     * @var string
     *
     * @ORM\Column(name="description", type="string", length=255, nullable=false)
     */
    private $description;

    /**
     * @var integer
     *
     * @ORM\Column(name="id_ticket", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idTicket;

    /**
     * @var \AppBundle\Entity\DegreImportance
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\DegreImportance")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_degre_importance", referencedColumnName="id_degre_importance")
     * })
     */
    private $idDegreImportance;

    /**
     * @var \AppBundle\Entity\Projet
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Projet")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_projet", referencedColumnName="id_projet")
     * })
     */
    private $idProjet;

    /**
     * @var \AppBundle\Entity\Statut
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Statut")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_statut", referencedColumnName="id_statut")
     * })
     */
    private $idStatut;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="AppBundle\Entity\Tags", inversedBy="ticketTicket")
     * @ORM\JoinTable(name="ticket_tags",
     *   joinColumns={
     *     @ORM\JoinColumn(name="ticket_id_ticket", referencedColumnName="id_ticket")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="tags_id_tag", referencedColumnName="id_tag")
     *   }
     * )
     */
    private $tagsTag;


    /**
     * @var \AppBundle\Entity\MiseAJour
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\MiseAJour")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_mise_a_jour", referencedColumnName="id_mise_a_jour", nullable=true)
     * })
     */
    private $miseAJour;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="AppBundle\Entity\FosUser")
     * @ORM\JoinTable(name="ticket_utilisateur",
     *   joinColumns={
     *     @ORM\JoinColumn(name="id_ticket", referencedColumnName="id_ticket")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="id_utilisateur", referencedColumnName="id")
     *   }
     * )
     */
    private $utilisateurs;


    /**
     * Constructor
     */
    public function __construct()
    {
        $this->tagsTag = new \Doctrine\Common\Collections\ArrayCollection();
        $this->suiviTickets = new \Doctrine\Common\Collections\ArrayCollection();
    }


    /**
     * Set libelle
     *
     * @param string $libelle
     *
     * @return Ticket
     */
    public function setLibelle($libelle)
    {
        $this->libelle = $libelle;

        return $this;
    }

    /**
     * Get libelle
     *
     * @return string
     */
    public function getLibelle()
    {
        return $this->libelle;
    }

    /**
     * Set description
     *
     * @param string $description
     *
     * @return Ticket
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Get idTicket
     *
     * @return integer
     */
    public function getIdTicket()
    {
        return $this->idTicket;
    }

    /**
     * Set idDegreImportance
     *
     * @param \AppBundle\Entity\DegreImportance $idDegreImportance
     *
     * @return Ticket
     */
    public function setIdDegreImportance(\AppBundle\Entity\DegreImportance $idDegreImportance = null)
    {
        $this->idDegreImportance = $idDegreImportance;

        return $this;
    }

    /**
     * Get idDegreImportance
     *
     * @return \AppBundle\Entity\DegreImportance
     */
    public function getIdDegreImportance()
    {
        return $this->idDegreImportance;
    }

    /**
     * Set idProjet
     *
     * @param \AppBundle\Entity\Projet $idProjet
     *
     * @return Ticket
     */
    public function setIdProjet(\AppBundle\Entity\Projet $idProjet = null)
    {
        $this->idProjet = $idProjet;

        return $this;
    }

    /**
     * Get idProjet
     *
     * @return \AppBundle\Entity\Projet
     */
    public function getIdProjet()
    {
        return $this->idProjet;
    }

    /**
     * Set idStatut
     *
     * @param \AppBundle\Entity\Statut $idStatut
     *
     * @return Ticket
     */
    public function setIdStatut(\AppBundle\Entity\Statut $idStatut = null)
    {
        $this->idStatut = $idStatut;

        return $this;
    }

    /**
     * Get idStatut
     *
     * @return \AppBundle\Entity\Statut
     */
    public function getIdStatut()
    {
        return $this->idStatut;
    }

    /**
     * Add tagsTag
     *
     * @param \AppBundle\Entity\Tags $tagsTag
     *
     * @return Ticket
     */
    public function addTagsTag(\AppBundle\Entity\Tags $tagsTag)
    {
        $this->tagsTag[] = $tagsTag;

        return $this;
    }

    /**
     * Remove tagsTag
     *
     * @param \AppBundle\Entity\Tags $tagsTag
     */
    public function removeTagsTag(\AppBundle\Entity\Tags $tagsTag)
    {
        $this->tagsTag->removeElement($tagsTag);
    }

    /**
     * Get tagsTag
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getTagsTag()
    {
        return $this->tagsTag;
    }


    /**
     * Set MiseAJour
     *
     * @param \AppBundle\Entity\MiseAJour $miseAJour
     *
     * @return Ticket
     */
    public function setMiseAJour(\AppBundle\Entity\MiseAJour $miseAJour = null)
    {
        $this->miseAJour = $miseAJour;

        return $this;
    }

    /**
     * Get miseAJour
     *
     * @return \AppBundle\Entity\MiseAJour
     */
    public function getMiseAJour()
    {
        return $this->miseAJour;
    }


    /**
     * Add utilisateur
     *
     * @param \AppBundle\Entity\FosUser $utilisateur
     *
     * @return Ticket
     */
    public function addUtilisateurs(\AppBundle\Entity\FosUser $utilisateur)
    {
        $this->utilisateurs[] = $utilisateur;

        return $this;
    }

    /**
     * Remove utilisateur
     *
     * @param \AppBundle\Entity\FosUser $utilisateur
     */
    public function removeUtilisateurs(\AppBundle\Entity\FosUser $utilisateur)
    {
        $this->utilisateurs->removeElement($utilisateur);
    }

    /**
     * Get Utilisateurs
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getUtilisateurs()
    {
        return $this->utilisateurs;
    }

}
