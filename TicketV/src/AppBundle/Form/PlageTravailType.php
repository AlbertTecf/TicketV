<?php

namespace AppBundle\Form;

use AppBundle\Entity\FosUser;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TimeType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Choice;

class PlageTravailType extends AbstractType
{
    /**
     * @var FosUser utilisateur
     */
    private $utilisateur;


    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $this->utilisateur = $options["utilisateur"];

        $builder->add('dateDebut', DateTimeType::class,['label'=>'Date début : ','widget' => 'single_text', 'format' => 'dd/MM/yyyy HH:mm'])
                ->add('dateFin', DateTimeType::class,['label'=>'Date fin : ','widget' => 'single_text', 'format' => 'dd/MM/yyyy HH:mm'])

            ->add('ticket', EntityType::class, array(
                'class' => 'AppBundle:Ticket',
                'choice_label' => 'libelle',
                'label'=>'Ticket : '
            ));

        if ($this->utilisateur){
            $builder ->add('utilisateur', EntityType::class, array(
                'class' => 'AppBundle:FosUser',
                'choice_label' => 'username',
                'label'=>'Utilisateur : ',
                'data'=> $this->utilisateur,
            ));
        }else {
            $builder->add('utilisateur', EntityType::class, array(
                'class'        => 'AppBundle:FosUser',
                'choice_label' => 'username',
                'label'        => 'Utilisateur : ',

            ));
        }

        $builder->add('remarque', TextareaType::class,['label'=>'Remarque : ','required'=>false]);

    }
    
    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\PlageTravail',
            'utilisateur'=>null

        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_plagetravail';
    }


}
